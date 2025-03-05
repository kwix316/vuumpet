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
	String marketing_sms_agree = request.getParameter("marketing_sms_agree");
	String email = request.getParameter("email");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2") +"-" + request.getParameter("phone3");
	String address = request.getParameter("addr");
	String detailaddress = request.getParameter("addr_detail");
	Database db = new Database();
   	String query = "WHERE email='" + email + "'";	
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
	      	if(marketing_sms_agree.isEmpty()){
	      		System.out.println("조건 true");
	      		String[] columns = {"email", "password", "name", "address", "detailaddress", "phone"};
	          	String[] types = {"string", "string", "string", "string", "string", "string"}; 
	         	 	String[] values = new String[] {
	         	 		email,
	         	 		password,
	         	 		name,
	         	 		address,
	         	 		detailaddress,
	         	 		phone,
	  	     	};
         	 	boolean check = db.InsertQuery("vuumpet_users", columns, values, types);
     	 		if(!check){
     	 			//DB 오류 시 쿠키에 메시지 담아서 이전 페이지로 이동
	  	   	 		String url = request.getHeader("Referer");
	  	   	   	 	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("다시 시도해 주세요","utf-8" ));
	  	   		   	rentalCookie .setMaxAge(24 * 60 * 60);
	  	   		   	response.addCookie(rentalCookie); 
	  	   			response.sendRedirect(url);
     	 		}else{
     	   			session.setAttribute("id", email);
     	   	 		response.sendRedirect("index.jsp");
     	   	 	}
	      	}else{
	      		System.out.println("조건 false");
	      		String[] columns = {"email", "password", "name", "address", "detailaddress", "phone", "sms"};
	          	String[] types = {"string", "string", "string", "string", "string", "string", "int"}; 
	         	 	String[] values = new String[] {
	         	 		email,
	         	 		password,
	         	 		name,
	         	 		address,
	         	 		detailaddress,
	         	 		phone,
	         	 		"1"
	    	 	    };
	     	   	 	boolean check =  db.InsertQuery("vuumpet_users", columns, values, types);
	     	   	 	if(!check) {
	     	   			//DB 오류 시 쿠키에 메시지 담아서 이전 페이지로 이동
	     	   	 		String url = request.getHeader("Referer");
	  	   	   	 	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("다시 시도해 주세요","utf-8" ));
	  	   		   	rentalCookie .setMaxAge(24 * 60 * 60);
	  	   		   	response.addCookie(rentalCookie); 
	     	   			response.sendRedirect(url);
	     	   	 	}else{
	     	   			session.setAttribute("id", email);
	     	   	 		response.sendRedirect("index.jsp");
	     	   	 	}
	      	}
   	 	}else{
	      	//이미 존재 하는 이메일이면 쿠키에 메시지를 담아서 이전 페이지로 이동
	      	String url = request.getHeader("Referer");
	     	Cookie rentalCookie  =  new Cookie("msg", URLEncoder.encode("이미 존재 하는 이메일입니다","utf-8" ));
	  	   	rentalCookie .setMaxAge(24 * 60 * 60);
	  	   	response.addCookie(rentalCookie); 
	  		response.sendRedirect(url);
      	}
   	}
 
%>
</body>
</html>