package sql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
