package sql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Database {
	public Database() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 등록 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버 등록 실패");
		}
	}
	public Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; //데이터베이스버전@접속주소
		String username = "c##dbexam";//사용자 계정
		String password = "m1234"; //비번
		
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("접속성공");
		} catch (SQLException e) {
			System.out.println("접속 실패");
				e.printStackTrace();
		}
		return conn;
	}
	public Map<String, Object>  SelectQuery(String table, String query ){
		String sql = "SELECT * FROM " + table + " " + query; 
		List<String[]> results = new ArrayList<>();
		Map<String, Object> response = new HashMap<>();
		 
		try (Connection conn = getConnection(); 
		     PreparedStatement pstmt = conn.prepareStatement(sql); 
		     ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
	            String[] row = new String[rs.getMetaData().getColumnCount()];
	            for (int i = 0; i < row.length; i++) {
	                row[i] = rs.getString(i + 1);
	            }
	            results.add(row);
	        }
			response.put("success", true);
		    response.put("results", results);
		}catch (SQLException e) {
			e.printStackTrace();
			response.put("success", false);
		    response.put("results", null);
		}
		return response;
	}
	public boolean InsertQuery(String table, String[] columns, String[] values, String[] types) {
	    StringBuilder sql = new StringBuilder("INSERT INTO " + table + " (");
	    for (String column : columns) {
	        sql.append(column).append(", ");
	    }
	    sql.setLength(sql.length() - 2); // 마지막 쉼표 제거
	    sql.append(") VALUES (");
	    for (int i = 0; i < values.length; i++) {
	        sql.append("?, ");
	    }
	    sql.setLength(sql.length() - 2); // 마지막 쉼표 제거
	    sql.append(")");

	    try(Connection conn = getConnection(); 
	            PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
	        for (int i = 0; i < values.length; i++) {
	            // 각 컬럼 타입에 따라 적절한 메서드를 호출
	            switch (types[i].toLowerCase()) {
	                case "string":
	                    pstmt.setString(i + 1, values[i]);
	                    break;
	                case "int":
	                    pstmt.setInt(i + 1, Integer.parseInt(values[i]));
	                    break;
	                case "double":
	                    pstmt.setDouble(i + 1, Double.parseDouble(values[i]));
	                    break;
	                case "date":
	                    pstmt.setDate(i + 1, Date.valueOf(values[i])); // YYYY-MM-DD 형식
	                    break;
	                default:
	                    pstmt.setString(i + 1, values[i]); // 기본적으로 String 처리
	                    break;
	            }
	        }
	        System.out.println(sql);
	        return pstmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    	return false;
	    } 
	}
	public boolean DeleteQuery(String table, String condition) {
		 String sql = "DELETE FROM " + table + " WHERE " + condition;

        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            System.out.println(sql);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	public boolean UpdateQuery(String table, String[] columns, String[] values, String[] types, String condition) {
        StringBuilder sql = new StringBuilder("UPDATE " + table + " SET ");
        for (int i = 0; i < columns.length; i++) {
            sql.append(columns[i]).append(" = ?, ");
        }
        sql.setLength(sql.length() - 2); // 마지막 쉼표 제거
        sql.append(" WHERE ").append(condition);

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < values.length; i++) {
                switch (types[i].toLowerCase()) {
                    case "string":
                        pstmt.setString(i + 1, values[i]);
                        break;
                    case "int":
                        pstmt.setInt(i + 1, Integer.parseInt(values[i]));
                        break;
                    case "double":
                        pstmt.setDouble(i + 1, Double.parseDouble(values[i]));
                        break;
                    case "date":
                        pstmt.setDate(i + 1, Date.valueOf(values[i]));
                        break;
                    default:
                        pstmt.setString(i + 1, values[i]);
                        break;
                }
            }
            System.out.println(sql);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	public Map<String, Object> getQnaList(int currentPage, int postsPerPage) {
	    Map<String, Object> resultData = new HashMap<>();
	    List<Map<String, Object>> posts = new ArrayList<>();
	    int totalPosts = 0;

	    // 전체 게시글 수 조회
	    String countSql = "SELECT COUNT(*) FROM vuumpet_qna_board";
	    try (Connection conn = getConnection();
	         PreparedStatement countPstmt = conn.prepareStatement(countSql);
	         ResultSet countRs = countPstmt.executeQuery()) {
	        if (countRs.next()) {
	            totalPosts = countRs.getInt(1);
	        }
	    } catch (SQLException e) {
	        System.err.println("Error counting posts: " + e.getMessage());
	        e.printStackTrace();
	        resultData.put("posts", posts); // 비어있는 리스트 반환
	        resultData.put("totalPosts", 0);
	        return resultData; // 오류 시 빈 데이터 반환
	    }

	    // 페이징 계산
	    int startRow = (currentPage - 1) * postsPerPage + 1;
	    int endRow = startRow + postsPerPage - 1;

	    // 특정 페이지 게시글 목록 조회 (Oracle 페이징 쿼리 사용)
	 // JOIN을 통해 사용자 이름 가져오기
	 // 공지사항(qna_is_notice=1)을 먼저, 그 다음 최신글(qna_id DESC) 순으로 정렬
	    String listSql = "SELECT qna_id, user_id, qna_title, qna_content, qna_regdate, qna_is_secret, qna_is_notice, user_email " +
	    	    "FROM ( " +
	    	    "    SELECT b.qna_id, b.user_id, b.qna_title, b.qna_content, b.qna_regdate, b.qna_is_secret, b.qna_is_notice, " +
	    	    "           u.email as user_email, " +
	    	    "           ROWNUM as rnum " +
	    	    "    FROM ( " +
	    	    "        SELECT * " +
	    	    "        FROM vuumpet_qna_board " +
	    	    "        ORDER BY qna_is_notice DESC, qna_id DESC " +
	    	    "    ) b JOIN vuumpet_users u ON b.user_id = u.email " + // u.id를 u.email로 변경
	    	    "    WHERE ROWNUM <= ? " +
	    	    ") " +
	    	    "WHERE rnum >= ?";

	    try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(listSql)) {

	        pstmt.setInt(1, endRow);
	        pstmt.setInt(2, startRow);

	        try (ResultSet rs = pstmt.executeQuery()) {
	            ResultSetMetaData metaData = rs.getMetaData();
	            int columnCount = metaData.getColumnCount();

	            while (rs.next()) {
	                Map<String, Object> row = new HashMap<>();
	                for (int i = 1; i <= columnCount; i++) {
	                    // Oracle에서는 보통 컬럼명이 대문자로 반환됩니다.
	                    String columnName = metaData.getColumnName(i).toUpperCase();
	                    Object value = rs.getObject(i);
	                    // 날짜 타입 포맷 변경이 필요하면 여기서 처리 가능 (예: Timestamp -> String)
	                    // if (value instanceof java.sql.Timestamp) {
	                    //     value = new java.text.SimpleDateFormat("yyyy-MM-dd").format(value);
	                    // }
	                    row.put(columnName, value);
	                }
	                posts.add(row);
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("Error fetching post list: " + e.getMessage());
	        e.printStackTrace();
	        // 오류 발생 시 비어있는 리스트라도 반환하도록 설정
	    }

	    resultData.put("posts", posts);
	    resultData.put("totalPosts", totalPosts);
	    return resultData;
	}
}
