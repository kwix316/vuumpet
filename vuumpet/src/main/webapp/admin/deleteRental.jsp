<%@page import="sql.Database"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    String phone = request.getParameter("phone");
    Database db = new Database();
    boolean success = db.DeleteQuery("vuumpet_rental", "phone = '" + phone + "'");

    response.setContentType("application/json");
    response.getWriter().write("{\"success\":" + success + ", \"message\":\"" + (success ? "삭제 완료" : "삭제 실패") + "\"}");
%>
