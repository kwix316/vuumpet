<%@page import="sql.Database"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Database db = new Database();
    boolean success = db.DeleteQuery("vuumpet_category", "id = '" + id + "'");

    response.setContentType("application/json");
    response.getWriter().write("{\"success\":" + success + ", \"message\":\"" + (success ? "삭제 완료" : "삭제 실패") + "\"}");
%>
