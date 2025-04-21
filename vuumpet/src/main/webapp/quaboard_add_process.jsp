<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sql.Database" %>
<%@ page import="java.util.*" %>

<%
    // 0. 로그인 상태 재확인
    String userIdStr = (String)session.getAttribute("id");
    if (userIdStr == null || userIdStr.isEmpty()) {
        response.sendRedirect("./login.jsp?alert=session_expired");
        return;
    }
    // 관리자 여부 확인 (예시: ID가 'admin'일 경우)
    boolean isAdmin = userIdStr.equals("admin"); // 실제 관리자 확인 로직 필요

    // 1. 파라미터 인코딩
    request.setCharacterEncoding("UTF-8");

    // 2. 폼 데이터 받기
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String isSecretStr = request.getParameter("is_secret");
    String isNoticeStr = request.getParameter("is_notice"); // 공지사항 파라미터 받기

    // 기본값 설정
    String isSecretValue = (isSecretStr != null && isSecretStr.equals("1")) ? "1" : "0";
    // 공지사항은 관리자만 설정 가능
    String isNoticeValue = (isAdmin && isNoticeStr != null && isNoticeStr.equals("1")) ? "1" : "0";

    // 3. 데이터 유효성 검사
    if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
        response.sendRedirect("./quaboard_writer.jsp?error=required_fields_missing");
        return;
    }

    // 4. Database 객체 생성
    Database db = new Database();

    // 5. InsertQuery 파라미터 준비
    String tableName = "vuumpet_qna_board";
    // 컬럼 목록에 qna_is_notice 추가
    String[] columns = {"user_id", "qna_title", "qna_content", "qna_is_secret", "qna_is_notice"};
    // 값 목록에 isNoticeValue 추가
    String[] values = {userIdStr, title, content, isSecretValue, isNoticeValue};
    // 타입 목록에 "int" 추가
    String[] types = {"string", "string", "string", "int", "int"};

    // 6. InsertQuery 메서드 호출
    boolean isSuccess = db.InsertQuery(tableName, columns, values, types);

    // 7. 결과에 따른 페이지 이동
    if (isSuccess) {
        response.sendRedirect("./quaboard.jsp");
    } else {
        response.sendRedirect("./quaboard_writer.jsp?error=save_failed");
    }
%>