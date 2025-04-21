.3<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Bootstrap demo</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <link rel="stylesheet" href="./css/font.css">
	    <link rel="stylesheet" href="./css/site_join.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="./css/menu.css">
  	<body>
  		<%
  			request.setCharacterEncoding("utf-8");
  			//필수 파라미터
  			String policy_agree = request.getParameter("policy_agree");
  			String privacy_agree = request.getParameter("privacy_agree");
  			String limit_join_agree = request.getParameter("limit_join_agree");
  			//선택적 파라미터
  			String marketing_sms_agree = request.getParameter("marketing_sms_agree");
		 	if (policy_agree == null || policy_agree.isEmpty() ||
			    privacy_agree == null || privacy_agree.isEmpty() ||
			    limit_join_agree == null || limit_join_agree.isEmpty()) {
			        response.sendRedirect("site_join_agree.jsp");
	    	}
  		%>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid">
	    	<img src="./img/site_join_agree/img01.jpg" alt="" class="d-none d-lg-block img-fluid"/>
	    	<div class="container">
	    		<h4 class="ScoreDreamRegular my-5 d-block d-lg-none">붐펫 회원가입 정보입력</h4>
	    	</div>
   			<form action="site_join_process.jsp" method="post">
   				<input type="hidden" name="marketing_sms_agree" value="<%=marketing_sms_agree%>"/>
   				<div class="row justify-content-center mt-5">
   					<div class="max-width-586">
   						<label for="email" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">이메일<i class="redcircle"></i></label>
   						<input name="email" id="email" type="text" class="form-control rounded-0 shadow-none font-size-13" placeholder="이메일" required/>
   					</div>
   				</div>
   				<div class="row justify-content-center ">
   					<div class="max-width-586">
   						<label for="pw" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">비밀번호<i class="redcircle"></i></label>
   						<input id="pw" name="pw" type="password" class="form-control rounded-0 shadow-none font-size-13" placeholder="비밀번호" required/>
   						<input name="pw_confirm" type="password" class="form-control rounded-0 shadow-none font-size-13" placeholder="비밀번호 확인" required/>
   					</div>
   				</div>
   				<div class="row justify-content-center">
   					<div class="max-width-586">
   						<label for="name" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">이름<i class="redcircle"></i></label>
   						<input type="text" class="form-control rounded-0 shadow-none" placeholder="이름을(를) 입력하세요" id="name" name="name" required/>
   					</div>
				</div>
				<div class="row justify-content-center">				
					<div class="max-width-586">
				    	<label class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">연락처<i class="redcircle"></i></label>
					    <div class="d-flex">
					        <div class="col-4">
					            <input type="text" class="form-control rounded-0 shadow-none" placeholder="010" id="phone1" name="phone1"/>
					        </div>
					        <div class="col-4">
					            <input type="text" class="form-control rounded-0 shadow-none" placeholder="1234" id="phone2" name="phone2"/>
					        </div>
					        <div class="col-4">
					            <input type="text" class="form-control rounded-0 shadow-none" placeholder="1234" id="phone3" name="phone3"/>
					        </div>
					    </div>
					</div>
				</div>
				<div class="row justify-content-center">
				    <div class="max-width-586">
				        <label class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">주소<i class="redcircle"></i></label>
				        <input type="hidden" name="addr_country" value="KR">
				        <div id="kr_addr_form_wrap" class="_addr_form_wrap">
				            <div class="input-group mb-2"> <%-- input-group 사용 --%>
				                <input class="form-control rounded-0 shadow-none" type="text" id="join_addr_postcode" name="addr_post" placeholder="우편번호" value="" readonly>
				                <%-- 주소 검색 버튼 추가 --%>
				                <button class="btn btn-outline-secondary rounded-0" type="button" id="btn_find_address">주소 검색</button>
				            </div>
				            <%-- 주소 검색 API가 embed될 영역 (기존과 동일, 필요시 스타일 조정) --%>
				            <div id="join_addr_container" class="w-100" style="display:none; border: 1px solid #ced4da; margin-bottom: 0.5rem;">
				                <div class="_add_list w-100 h337" style="position:relative;"></div>
				            </div>
				            <div class="input_form _item _addr mb-2">
				                <input class="form-control rounded-0 shadow-none" type="text" id="join_addr" name="addr" placeholder="주소" value="" readonly>
				                <div class="alert-block _msg"></div>
				            </div>
				            <div class="position-relative">
				                <input class="form-control rounded-0 shadow-none" title="상세주소" type="text" id="join_addr_detail" name="addr_detail" placeholder="상세주소" value="">
				            </div>
				        </div>
				    </div>
				</div>
		
				<div class="row justify-content-center mt-4 mb-5">
					<div class="max-width-586">
						<div class="d-grid gap-2">
							  <button class="btn btn-primary rounded-0 ScoreDreamLight font-size-13" type="submit">가입하기</button>
						</div>
					</div>
				</div>	
   			</form>
	    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="./js/zipcode_daum.js"></script>
     	<script>
	 		$(window).on('load', function() {
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
		        var join_addr = new ZIPCODE_DAUM();
		        join_addr.init({
		            'addr_container': $('#join_addr_container'),        // API 표시될 컨테이너
		            'addr_pop': $('#join_addr_container ._add_list'), // API embed될 요소
		            'post_code': $('#join_addr_postcode'),        // 우편번호 input
		            'addr': $('#join_addr'),                    // 주소 input
		            // 'sub_addr': $('#sub_join_addr'),           // <-- 제거 (HTML에 해당 요소 없음)
		            'open_button': $('#btn_find_address'),      // <-- 새로 추가한 검색 버튼 타겟
		            'attachShowEventOnInput': false,            // <-- 주소 input 클릭 시 API 안 뜨도록 설정 (선택 사항)
		            'hideWhenClickOutside': true,               // <-- 외부 클릭 시 닫기 (유지)
		            'height': '100%',                           // API 높이
		            'onComplete': function(data) {              // 주소 선택 완료 시 콜백
		                console.log(data); // 선택된 주소 데이터 확인용 로그
		                // 우편번호(zonecode)와 주소(address 또는 roadAddress) 설정
		                $('#join_addr_postcode').val(data.zonecode || ''); // zonecode 사용
		                $('#join_addr').val(data.roadAddress || data.jibunAddress || ''); // 도로명 우선, 없으면 지번

		                // 상세주소 입력 필드로 포커스 이동
		                $('#join_addr_detail').focus();

		                // --- 영문 주소 파싱 및 숨겨진 필드 설정 로직 제거 ---
		            },
		            'onClose': function() {                       // 검색창 닫힐 때 콜백
		                // JS로 스타일 조작하는 부분 제거 (필요 시 CSS로 처리)
		                console.log('Daum Postcode closed');
		            }
		             // 'onShow' 콜백도 제거 (필요 시 CSS로 처리)
		        });
			});
	 		function test() {
				const checkall = $("#checkall")
				if(checkall.prop("checked")){
					$('input[type="checkbox"]').prop("checked", true);
				}else{
					$('input[type="checkbox"]').prop("checked", false);
				}
				  
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