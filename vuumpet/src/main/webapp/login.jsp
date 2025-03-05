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
	    <link rel="stylesheet" href="./css/login.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		  <link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid px-0">
	    		<img src="./img/site_join_agree/img01.jpg" alt="" class="d-none d-lg-block img-fluid"/>
	    </div>
	    <div class="container my-5">
	    	<form action="login_process.jsp" method="post" name="frm">
	    		<div>
		    		<h4 class="ScoreDreamRegular my-5 d-block d-lg-none">로그인</h4>
		    	</div>
		    	<div class="row justify-content-center align-items-center">
				    <div class="col-12 col-lg-5">
			    		<label for="email" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">이메일<i class="redcircle"></i></label>
						<input type="text" class="form-control rounded-0 shadow-none" id="email" name="email" required/>
			    	</div>	
		    	</div>
		    	<div class="row justify-content-center align-items-center">
		    		<div class="col-12 col-lg-5">
			    		<label for="email" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">비밀번호<i class="redcircle"></i></label>
						<input type="password" class="form-control rounded-0 shadow-none" id="pw" name="pw" required/>
			    	</div>
		    	</div>
		    	<div class="row justify-content-center align-items-center">
		    		<div class="col-12 col-lg-5">
					   	<div class="d-grid gap-2 mt-3 mb-5">
						  	<button class="btn btn-primary" type="button" onclick="checkInput()">로그인</button>
						</div>
		    		</div>
		    	</div>
	    	</form>
	    	
	    	
	    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	     <script>
	      $(function(){
	        get_nav()
          	$(window).on("resize", function(e){
          		get_nav()
          		
	        })
			 let cookieArr = document.cookie.split(";")
			let msg = ""
			for (let i = 0; i < cookieArr.length; i++) {
		        let cookiePair = cookieArr[i].split("=")
		        if ("msg" === cookiePair[0].trim()) {
		        	msg = decodeURIComponent(cookiePair[1].replace(/\+/g, " "));
		          	break;
		        }
		    }
			if (msg) {
		        $("#msg").text(msg);
		        document.cookie = "msg=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/vuumpet";
		        const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
		        myModal.show();
		    }
			
	      
	      })
	    function checkInput() {
			let frm =  document.frm
			let email = frm.email.value
			let password = frm.pw.value
			if (!email || !password) {
				$("#msg").text("필수 항목을 입력하여 주시기 바랍니다");
				const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
			    myModal.show();
			    return false;
			}
			frm.submit()
		}
	    </script>
     	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered justify-content-center">
	            <div class="modal-content" style="width: 290px;">
	                <div class="container-fluid css-modal-content font-size-13 ScoreDreamLight dark_Gray text-center">
	                    <p class="my-0" id="msg"></p>
	                </div>
	                <div class="font-size-13 ScoreDreamLight dark_Gray text-center border-top w-100">
	                    <a class="css-modal-btn dark_Gray py-10" data-bs-dismiss="modal">확인</a>
	                </div>
	            </div>
	        </div>
		</div>
	</body>	
</html>