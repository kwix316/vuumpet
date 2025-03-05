<%@page import="sql.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category_addprocess.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String link = request.getParameter("link");
	Database db = new Database();
	String[] columns = {"category_name", "category_link"};
  	String[] types = {"string", "string"}; 
 	String[] values = new String[] {
		title,
		link.isEmpty() ?  null : link,
   	};
	boolean check = db.InsertQuery("vuumpet_category", columns, values, types);
	response.sendRedirect("category.jsp");
%>
</body>
</html>