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
	    <link rel="stylesheet" href="./css/quaboard.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		  <link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid px-0 position-relative py-140 d-none d-lg-block mb-5">
	    	<div class="bg"></div>
   			<!-- <img src="./img/quaboard/img01.jpg" alt="" class="img-fluid"/> -->
    		<div class="ScoreDreamBold position-relative css-left">
   				<p class="mb-0 font-size-24 dark_Gray">고객님의 소중한 문의</p>
   				<p class="mb-0 font-size-24 dark_Gray">기다리고 있어요</p>
   			</div>
    	</div>
	    <div class="container-fluid">
   		    <div class="container ScoreDreamLight text-center">
		    	<div class="my-5">
		    		<h4 class="ScoreDreamMedium">제품 문의</h4>
		    		<p class="ScoreDreamLight">고객센터 문의 1577-3516</p>
		    	</div>
		    </div>
		    <div class="d-block d-lg-none text-center mb-5">
   			    <a href="http://pf.kakao.com/_jguxeT/chat">
			    	<img src="./img/quaboard/img02.jpg" alt="" class="img-fluid"/>
			    </a>
		    </div>
	    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	      <script>
      	// 기존 $(document).ready() 대신 사용
	</body>	
</html>