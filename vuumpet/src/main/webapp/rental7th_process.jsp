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
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2") +"-" + request.getParameter("phone3");
	String[] selectedProducts = request.getParameterValues("products");
	String time = request.getParameter("time");
	Database db = new Database();
   	String query = "WHERE name='" + name + "' AND phone='" + phone + "'";
   	Map<String, Object> queryResult  = db.SelectQuery("vuumpet_rental", query);
   	boolean success = (boolean) queryResult.get("success"); 
   	if(!success){
   		Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("다시 시도해 주세요","utf-8"));
    	rentalCookie .setMaxAge(24 * 60 * 60);
    	response.addCookie(rentalCookie);
    	response.sendRedirect("rental7th.jsp");
   	}else{
   		List<String[]> results = (List<String[]>) queryResult.get("results"); 
   	    if (results.isEmpty()) {
   	    	String[] columns = {"name", "phone", "product", "time"};
   	    	String[] types = {"string", "string", "string", "string"}; 
   	   	 	String[] values = new String[] {
   	 	        name,
   	 	        phone,
   	 	        String.join(",", selectedProducts),
   	 	        time
   	 	     };
   	   	 	db.InsertQuery("vuumpet_rental", columns, values, types);
   	    	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("정상적으로 접수되었습니다","utf-8" ));
   	    	rentalCookie .setMaxAge(24 * 60 * 60);
   	    	response.addCookie(rentalCookie);
   	    }else{
   	    	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("이미 신청을 하셨습니다.","utf-8"));
   	    	rentalCookie .setMaxAge(24 * 60 * 60);
   	    	response.addCookie(rentalCookie);
   	    }
   		response.sendRedirect("rental7th.jsp");
	}	


%>
</body>
</html>