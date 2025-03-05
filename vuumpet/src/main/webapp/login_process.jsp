<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="sql.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>site_join_process.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("pw");
	Database db = new Database();	
	String query = "WHERE email='" + email + "' AND password='" + password + "'";
   	Map<String, Object> queryResult = db.SelectQuery("vuumpet_users", query);
 	boolean success = (boolean) queryResult.get("success"); 
   	if(!success){
   		String url = request.getHeader("Referer");
   	 	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("다시 시도해 주세요","utf-8" ));
	   	rentalCookie .setMaxAge(24 * 60 * 60);
	   	response.addCookie(rentalCookie); 
		response.sendRedirect(url);
   	}else{
   		List<String[]> results = (List<String[]>) queryResult.get("results"); 
   	  	if (results.isEmpty()) {
	      	String url = request.getHeader("Referer");
	     	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("아이디 혹은 비밀번호가 틀렸습니다","utf-8" ));
	  	   	rentalCookie .setMaxAge(24 * 60 * 60);
	  	   	response.addCookie(rentalCookie); 
	  		response.sendRedirect(url);;
   	 	}else{

	  		session.setAttribute("id", email);
	 		response.sendRedirect("index.jsp");
      	}
   	}
 
%>
</body>
</html>