<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Bootstrap demo</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <link rel="stylesheet" href="./css/font.css">
	    <link rel="stylesheet" href="./css/shop.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		  <link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid position-relative px-0 css-height">
	    	<div class="bg"></div>
	    	<div class="container position-relative text-center text-lg-end css-section top-189">
	    		<h4 class="ScoreDreamBold dark_Gray font-size-media-20">2024 ALL NEW</h4>
	    		<p class="ScoreDreamRegular dark_Gray font-size-media-17">완전하고 완벽하다</p>
	    		<a href="./7thdryroom.jsp" class="btn btn-dark rounded-pill button-padding">
	    			<p class="my-0 font-size-media-12">
	    				<i class="fa-solid fa-angle-right d-none d-lg-inline-block"></i>
	    				 신제품 구매
   				 	</p>
	    		</a>
	    	</div>
	    </div>
    	<section id="7th" class="container px-0">
    		<div class="container my-lg-5 test">
	    		<div class="d-flex justify-content-center flex-wrap gap-10 line">
	    			<div class="px-14-py-8">
		    			<a class="dark_Gray  font-size-13 ScoreDreamLight active menu-item">봄펫 드라이룸</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight menu-item">봄펫 카시트&켄넬</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight menu-item">아로마케어&기타소모품</a>
	    			</div>
	    		</div>
	    	</div>
    		<div class="row">
    			<%
				        Database db = new Database();
				        String query = "WHERE category_name='" + "신제품 드라이룸" + "' FETCH FIRST 1 ROWS ONLY";
				        Map<String, Object> categoryQueryResult = db.SelectQuery("vuumpet_category", query);
				        boolean success = (boolean) categoryQueryResult.get("success");
				        if (success) {	
				            List<String[]> categoryInfo = (List)categoryQueryResult.get("results");
				            NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
				            formatter.setMinimumFractionDigits(0);
				            formatter.setMaximumFractionDigits(0);
				         
				           	for (String[] category : categoryInfo) {
				           	   	String categoryId = category[0];
				           		query = "WHERE category_id='" + categoryId + "'";
						        Map<String, Object> productQueryResult = db.SelectQuery("vuumpet_product", query);
						        success = (boolean) productQueryResult.get("success");
						        if (success) {	
						        	List<String[]> prodcutInfo = (List)productQueryResult.get("results");
						        	for (String[] product : prodcutInfo) {
						        		String productNum = product[0];
						        		String prodcutName = product[1];
						        		String prodcutImg = product[2];
						        		String prodcutInfoText = product[4];
						        		String prodcutPrice = formatter.format(Integer.parseInt(product[3])) + "원";
				           	   
				%>
	    		<div class="col-12 col-lg-3 p-5 p-lg-1">
	    			<a href="./product_detail.jsp?idx=<%=productNum %>" class="d-block text-decoration-none dark_Gray">
	    				<div>
		    				<img src="<%=prodcutImg %>" alt="" class="img-fluid" />
		    			</div>
		    			<div class="text-center text-lg-start">
		    				<p class="ScoreDreamRegular my-1 font-size-14 "><%=prodcutName %></p>
		    				<p class="ScoreDreamLight font-size-14 mb-0"><%=prodcutPrice%></p>
		    				<%=prodcutInfoText%>
		    			</div>
	    			</a>
	    		</div>
	    		<%
					        	}
					        }
			           	}
			        }
    			%>
	    	</div>
    	</section>
		<div class="container-fluid position-relative px-0 css-height">
	    	<div class="bg2"></div>
	    	<div class="container position-relative text-start css-section top-189">
	    		<h4 class="ScoreDreamBold dark_Gray font-size-media-20">봄펫 카시트&켄넬</h4>
	    		<p class="ScoreDreamRegular dark_Gray font-size-media-17">vuumpet Soft Carrier</p>
	    	</div>
	    </div>
	    <section id="carrier" class="container px-0">
    		<div class="container my-lg-5 test">
	    		<div class="d-flex justify-content-center flex-wrap gap-10 line">
	    			<div class="px-14-py-8">
		    			<a class="dark_Gray  font-size-13 ScoreDreamLight menu-item">봄펫 드라이룸</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight active menu-item">봄펫 카시트&켄넬</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight menu-item">아로마케어&기타소모품</a>
	    			</div>
	    		</div>
	    	</div>
    		<div class="row">
    			<%
				       	query = "WHERE category_name='" + "큐브드라이어&켄넬" + "' FETCH FIRST 1 ROWS ONLY";
				        categoryQueryResult = db.SelectQuery("vuumpet_category", query);
				        success = (boolean) categoryQueryResult.get("success");
				        if (success) {	
				            List<String[]> categoryInfo = (List)categoryQueryResult.get("results");
				            NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
				            formatter.setMinimumFractionDigits(0);
				            formatter.setMaximumFractionDigits(0);
				         
				           	for (String[] category : categoryInfo) {
				           	   	String categoryId = category[0];
				           		query = "WHERE category_id='" + categoryId + "'";
						        Map<String, Object> productQueryResult = db.SelectQuery("vuumpet_product", query);
						        success = (boolean) productQueryResult.get("success");
						        if (success) {	
						        	List<String[]> prodcutInfo = (List)productQueryResult.get("results");
						        	for (String[] product : prodcutInfo) {
						        		String productNum = product[0];
						        		String prodcutName = product[1];
						        		String prodcutImg = product[2];
						        		String prodcutInfoText = product[4];
						        		String prodcutPrice = formatter.format(Integer.parseInt(product[3])) + "원";
				           	   
				%>
	    		<div class="col-12 col-lg-3 p-5 p-lg-1">
	    			<a href="./product_detail.jsp?idx=<%=productNum %>" class="d-block text-decoration-none dark_Gray">
	    				<div>
		    				<img src="<%=prodcutImg %>" alt="" class="img-fluid" />
		    			</div>
		    			<div class="text-center text-lg-start">
		    				<p class="ScoreDreamRegular my-1 font-size-14 "><%=prodcutName %></p>
		    				<p class="ScoreDreamLight font-size-14 mb-0"><%=prodcutPrice%></p>
		    				<%=prodcutInfoText%>
		    			</div>
	    			</a>
	    		</div>
	    		<%
					        	}
					        }
			           	}
			        }
    			%>
	    	</div>
    	</section>
    	<div class="container-fluid position-relative px-0 css-height">
	    	<div class="bg3"></div>
	    	<div class="container position-relative text-start css-section top-189">
	    		<h4 class="ScoreDreamBold dark_Gray font-size-media-20">붐펫 악세서리</h4>
	    		<p class="ScoreDreamRegular dark_Gray font-size-media-17">vuumpet Accessary</p>
	    	</div>
	    </div>
	    <section id="accessary" class="container px-0">
    		<div class="container my-lg-5 test">
	    		<div class="d-flex justify-content-center flex-wrap gap-10 line">
	    			<div class="px-14-py-8">
		    			<a class="dark_Gray  font-size-13 ScoreDreamLight menu-item">봄펫 드라이룸</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight  menu-item">봄펫 카시트&켄넬</a>
		    		</div>
		    		<div class="px-14-py-8">
		    			<a class="dark_Gray font-size-13 ScoreDreamLight active menu-item">아로마케어&기타소모품</a>
	    			</div>
	    		</div>
	    	</div>
    		<div class="row">
    			<%
				       	query = "WHERE category_name='" + "케어&기타소모품" + "' FETCH FIRST 1 ROWS ONLY";
				        categoryQueryResult = db.SelectQuery("vuumpet_category", query);
				        success = (boolean) categoryQueryResult.get("success");
				        if (success) {	
				            List<String[]> categoryInfo = (List)categoryQueryResult.get("results");
				            NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
				            formatter.setMinimumFractionDigits(0);
				            formatter.setMaximumFractionDigits(0);
				         
				           	for (String[] category : categoryInfo) {
				           	   	String categoryId = category[0];
				           		query = "WHERE category_id='" + categoryId + "'";
						        Map<String, Object> productQueryResult = db.SelectQuery("vuumpet_product", query);
						        success = (boolean) productQueryResult.get("success");
						        if (success) {	
						        	List<String[]> prodcutInfo = (List)productQueryResult.get("results");
						        	for (String[] product : prodcutInfo) {
						        		String productNum = product[0];
						        		String prodcutName = product[1];
						        		String prodcutImg = product[2];
						        		String prodcutInfoText = product[4];
						        		String prodcutPrice = formatter.format(Integer.parseInt(product[3])) + "원";
				           	   
				%>
	    		<div class="col-12 col-lg-3 p-5 p-lg-1">
	    			<a href="./product_detail.jsp?idx=<%=productNum %>" class="d-block text-decoration-none dark_Gray">
	    				<div>
		    				<img src="<%=prodcutImg %>" alt="" class="img-fluid" />
		    			</div>
		    			<div class="text-center text-lg-start">
		    				<p class="ScoreDreamRegular my-1 font-size-14 "><%=prodcutName %></p>
		    				<p class="ScoreDreamLight font-size-14 mb-0"><%=prodcutPrice%></p>
		    				<%=prodcutInfoText%>
		    			</div>
	    			</a>
	    		</div>
	    		<%
					        	}
					        }
			           	}
			        }
    			%>
	    	</div>
    	</section>
     	<%@include file="footer.jsp" %>
     	
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
		<script src="./js/shop.js"></script>

	</body>	
</html>