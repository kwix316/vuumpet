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
	    <link rel="stylesheet" href="./css/index.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		  <link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid">
	        <img src="./img/index/img01.jpg" alt="" class="bg d-none d-lg-block">
	        <img src="./img/index/img-mo-01.jpg" alt="" class="bg d-lg-none">
	    </div>
	    <div class="container-fluid px-0 my-5 text-center">
	    	<div class="container my-5">
		        <h4 class="ScoreDreamMedium dark_Gray my-0">붐펫의 다양한 제품을 만나보세요.</h4>
		        <p class="lead ScoreDreamLight dark_Gray">Vuumpet Category</p>
		        <hr class="mb-5">
		        <div class="row">
		          <div class="col-md-12 col-lg-4 mb-3">
		          	<a href="./shop.jsp">
		          		<img src="./img/index/img02.jpg" class="img-fluid rounded" alt="...">
		          	</a>
		          </div>
		          <div class="col-md-12 col-lg-4 mb-3">
		            <a href="./shop.jsp">
		           		<img src="./img/index/img03.jpg" class="img-fluid rounded" alt="...">
		           </a>
		          </div>
		          <div class="col-md-12 col-lg-4">
		           <a href="./shop.jsp">
		            <img src="./img/index/img04.jpg" class="img-fluid rounded" alt="...">
		            </a>             
		          </div>
		        </div>
	    	</div>
	    	<div class="container my-5 d-none d-lg-block">
	   		 	<h4 class="mb-4 ScoreDreamMedium mt-5 dark_Gray">붐펫 맞춤 제안</h4>
		        <p class="my-0 ScoreDreamLight dark_Gray">
		           우리 아이의 사이즈, 용도, 성향에 따라 선택할 수 있는 다양한 붐펫의 제품,
		        </p>
		        <p class="my-0 ScoreDreamLight dark_Gray">
		           선택이 어렵다면 붐펫 고객만족센터에 문의하세요
		        </p>
		        <div class="card my-5 ScoreDreamExLight dark_Gray">
		            <img src="./img/index/img05.jpg" class="card-img-top" alt="...">
		        </div>
	    	</div>
	    	<div class="container my-5 d-none d-lg-block">
		        <p class="ScoreDreamLight dark_Gray">프리미엄형 펫 케어 & 드라이룸</p>
		        <h4 class="mb-5 ScoreDreamMedium">봄펫 싱글 드라이룸</h4>
		       	<div class="d-flex text-center">
		       		<div class="me-2 mx-auto">
		       			<a href="./product_detail.jsp?idx=1">
							<img src="./img/index/img06.jpg" alt=""  width="513px"/>
						</a>
						<div class="row mt-4">
							<p class="ScoreDreamRegular dark_Gray">단델리온</p>
							<p class="ScoreDreamLight dark_Gray">10KG 내외 중형견/소형견 2마리 동시 사용</p>
						</div>
		       		</div>
		       		<div class="ms-2 mx-auto">
		       			<a href="./product_detail.jsp?idx=2">
		       				<img src="./img/index/img07.jpg" alt=""  width="513px">
		       			</a>
						<div class="row mt-4">
							<p class="ScoreDreamRegular dark_Gray">로투스</p>
							<p class="ScoreDreamLight dark_Gray">10KG 이상 중형견/20KG 내외 중대형견</p>
						</div>
		       		</div >
		       	</div>
	    	</div>
	    	<div class="css_bg py-5 my-5 d-none d-lg-block">
	    		<p class="ScoreDreamLight dark_Gray mt-5">듀얼 컨트롤 시스템 & 탈착형 칸막이</p>
		    	<h4 class="mb-5 ScoreDreamMedium">붐펫 듀얼 드라이룸</h4>
		    	<div class="my-5">
		    		<div class="d-flex text-center">
			       		<div class="me-2 mx-auto">
			       			<a href="./product_detail.jsp?idx=3">
								<img src="./img/index/img08.jpg" alt=""  width="513px"/>
							</a>
							<div class="row mt-4">
								<p class="ScoreDreamRegular dark_Gray">단델리온 듀얼</p>
								<p class="ScoreDreamLight dark_Gray">최대 25KG/다둥이 소형, 중형견 OR 중대형견</p>
							</div>
			       		</div>
			       		<div class="ms-2 mx-auto">
			       			<a href="./product_detail.jsp?idx=4">
			       				<img src="./img/index/img09.jpg" alt=""  width="513px">
		       				</a>
							<div class="row mt-4 px-0">
								<p class="ScoreDreamRegular dark_Gray">로투스 듀얼</p>
								<p class="ScoreDreamLight dark_Gray">45kg 내외 대형견/중형견 다둥이</p>
							</div>
			       		</div >
		       		</div>
		       	</div>
	    	</div>
	    	<div class="container">
	    		<h4 class="ScoreDreamLight dark_Gray">other product</h4>
	    		<p class="ScoreDreamLight dark_Gray mb-5">펫드라이룸과 함께 구매하면 좋은 붐펫의 다른 제품</p>
    			<div class="row align-items-center justify-content-center">
    				<div class="col-12 col-lg-6 mb-3">
    					<div class="overflow-hidden">
    						<img src="./img/index/img10.jpg" alt="" class="img-fluid transition-transform"/>
    						<div class="img_box2"></div>
    					</div>
    				</div>
    				<div class="col-12 col-lg-6 mb-3">
    					<div class="overflow-hidden">
    						<img src="./img/index/img11.jpg" alt="" class="img-fluid transition-transform"/>
    					</div>
    				</div>
    			</div>
    			
	    	</div>
	    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	</body>	
</html>