<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@page import="java.util.Locale"%>
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
	    <link rel="stylesheet" href="./css/7thdryroom.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	  	<link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid px-0 text-center">
	    	<div class="container d-none d-lg-block">
	    		<img src="./img/7thdryroom/img01.jpg" alt="" class="img-fluid" />
	    	</div>	
	    	<div class="d-block d-lg-none">
	    		<img src="./img/7thdryroom/img06.jpg" alt="" class="img-fluid" />
	    	</div>
			<div class="container p-4">
				<div class="row" >
					<%
					 	String idx = request.getParameter("idx");
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
						        		String prodcutPrice = formatter.format(Integer.parseInt(product[3])) + "원";
				           	   
					%>
					
		    			<div class="col-6 pb-4">
		    				<a href="./product_detail.jsp?idx=<%=productNum%>" class="text-decoration-none">
				    			<img src="<%=prodcutImg%>" alt=""  class="img-fluid"/>
			    				<p class="mb-0 ScoreDreamLight dark_Gray font-size-14 mt-3"><%=prodcutName%></p>
			    				<p class="mb-0 ScoreDreamMedium dark_Gray font-size-20 mt-1"><%=prodcutPrice%></p>
		    				</a>
		    			</div>
	    			<%
						        	}
						        }
				           	}
				        }
	    			%>
<!-- 	    			<div class="col-6 pb-4">
	    				<div>
    						<img src="./img/7thdryroom/img03.jpg" alt=""  class="img-fluid"/>
	    				</div>
  							<p class="mb-0 ScoreDreamLight dark_Gray font-size-14 mt-3">봄펫드라이룸 로루스</p>
	    				<p class="mb-0 ScoreDreamMedium dark_Gray font-size-20 mt-1">1,190,000원</p>
	    			</div> -->
<!-- 	    			<div class="col-6">
	    				<div>
	    					<img src="./img/7thdryroom/img04.jpg" alt=""  class="img-fluid"/>
	    				</div>
  							<p class="mb-0 ScoreDreamLight dark_Gray font-size-14 mt-3" >봄펫드라이룸 단델리온 듀얼</p>
	    				<p class="mb-0 ScoreDreamMedium dark_Gray font-size-20 mt-1">1,490,000원</p>
	    			</div>
	    			<div class="col-6">
	    				<div>
	    					<img src="./img/7thdryroom/img05.jpg" alt=""  class="img-fluid"/>
	    				</div>
  							<p class="mb-0 ScoreDreamLight dark_Gray font-size-14 mt-3">봄펫드라이룸 로루스 듀얼</p>
	    				<p class="mb-0 ScoreDreamMedium dark_Gray font-size-20 mt-1">1,990,000원</p>
	    			</div> -->
	    			<div class="col-12 my-5  d-none d-lg-block">
	    				<img src="./img/7thdryroom/img07.jpg" alt=""  class="img-fluid"/>
	    			</div>
    			</div>
			</div>
    	</div>

     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	     <script>
	      $(function(){
			const nav = $("nav")
			/* nav.removeClass("css_nav_color") */
	        get_nav()
          	$(window).on("resize", function(e){
          		get_nav()
	        })
	      })
	    </script>
	</body>	
</html>