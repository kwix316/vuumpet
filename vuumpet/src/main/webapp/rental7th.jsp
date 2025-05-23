<%@page import="java.net.URLDecoder"%>
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
   	    <link rel="stylesheet" href="./css/rental7th.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container px-0 text-center">
	    	<div class="d-none d-lg-block">
	    		<img src="./img/rental7th/img01.jpg" alt="" class="img-fluid" />
	    		<img src="./img/rental7th/img02.jpg" alt="" class="img-fluid" />
	    	</div>
	    	<div class="d-block d-lg-none">
	    		<img src="./img/rental7th/img01-mo.jpg" alt="" class="img-fluid" />
	    		<img src="./img/rental7th/img03-mo-2.jpg" alt="" class="img-fluid" />
	    		<img src="./img/rental7th/img02-mo.jpg" alt="" class="img-fluid" />
	    	</div>
	    </div>
	    <div class="container-fluid text-center px-0 mt-5">
	    	<div  class="">
	    		<div class="d-none d-lg-block css_light_gray_bg pt-5 pb-4">
	    			<img src="./img/rental7th/img03.jpg" alt="" class="img-fluid" />
	    		</div>
    			<div class="d-block d-lg-none">
	    			<img src="./img/rental7th/img03-mo.jpg" alt="" class="img-fluid" />
	    		</div>
	    	</div>
    		<div class="d-none d-lg-block css_beige_bg pt-5">
   				<img src="./img/rental7th/img04.jpg" alt="" class="img-fluid" />
    		</div>
   			<div class="d-block d-lg-none">
   				<div id="carouselExampleAutoplaying" class="carousel slide carousel-dark"  data-bs-ride="carousel">
				 	 <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
					    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="3" aria-label="Slide 4"></button>
				  	</div>
			  		<div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="./img/rental7th/img04-mo-1.jpg" class="d-block w-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="./img/rental7th/img04-mo-2.jpg" class="d-block w-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="./img/rental7th/img04-mo-3.jpg" class="d-block w-100" alt="...">
					    </div>
				        <div class="carousel-item">
					      <img src="./img/rental7th/img04-mo-4.jpg" class="d-block w-100" alt="...">
					    </div>
				  	</div>		  	
				</div>
    		</div>
	    	<div  class="d-none d-lg-block css_yellow_bg">
    			<a href="https://www.inicis.com/ini-rental-card" target="_blank" class="d-block w-100">
    				<img src="./img/rental7th/img05.jpg" alt="" class="img-fluid" />
    			</a>
	    	</div>
    		<div  class="d-block d-lg-none">
    			<a href="https://www.inicis.com/ini-rental-card" target="_blank" class="d-block w-100">
    				<img src="./img/rental7th/img05-mo.jpg" alt="" class="img-fluid" />
    			</a>
	    	</div>
	    </div>
		<div class="container">
			<div class="text-center">	
				<div class="border rounded d-inline-block px-3 py-2 font-size-17 mt-5 mb-3 text-center">
					<i class="fa-regular fa-pen-to-square"></i>
					<p class="ScoreDreamLight dark_Gray d-inline-block mb-0">무료 상담 신청란</p>
				</div>
			</div>
			<p class="ScoreDreamLight dark_Gray font-size-14 text-center">빈칸을 작성 후 "<u class="ScoreDreamRegular dark_Gray" >신청하기</u>"를 클릭해 주세요.</p>
			<hr class="mb-5" />
			<form action="rental7th-process.jsp" name="frm"  method="post">
				<label for="name" class="font-size-14 ScoreDreamLight d-block w-100 dark_Gray">*성함<i class="redcircle"></i></label>
				<input type="text" class="font-size-14 ScoreDreamLight w-100 px10py5" placeholder="" id="name"  name="name">
				<label for="phone" class="font-size-14 ScoreDreamLight d-block w-100 mt-3 dark_Gray">*연락처<i class="redcircle"></i></label>
				<div class="mb-3 d-flex">
					<input type="tel" class="w65px text-center font-size-14 ScoreDreamLight px10py5" placeholder="" id="phone" maxlength="3"  name="phone1">
					<span class="mx-1">-</span>
				  	<input type="tel" class=" w65px text-center font-size-14 ScoreDreamLight px10py5" placeholder="" id="phone"  maxlength="4" name="phone2" >
				  	<span class="mx-1">-</span>
				  	<input type="tel" class=" w65px text-center font-size-14 ScoreDreamLight px10py5" placeholder="" id="phone"  maxlength="4" name="phone3">
				</div>
				<label for="" class="font-size-14 ScoreDreamLight">*상담을 원하시는 제품<i class="redcircle"></i></label>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="단델리온" id="product1" name="products" >
				  <label class="font-size-14 ScoreDreamLight dark_Gray" for="product1">
			    	단델리온 (10kg 내외 중형견 및 소형견)
				  </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="로투스" id="product2" name="products" >
				  	<label class="font-size-14 ScoreDreamLight dark_Gray" for="product2">
			    		로투스 (10kg 이상 중형견 및 20kg 내외 중형견)
			 	 	</label>
				</div>
				<div class="form-check">
		    		<input class="form-check-input" type="checkbox" value="단델리온 듀얼" id="product3" name="products">
				  	<label class="font-size-14 ScoreDreamLight dark_Gray" for="product3">
			    		단델리온 듀얼 (최대 25kg 소형, 중형견 다둥이 및 중대형견)
				  	</label>
				</div>
				<div class="form-check">
		    		<input class="form-check-input" type="checkbox" value="로투스 듀얼" id="product4"  name="products" >
				  	<label class="font-size-14 ScoreDreamLight dark_Gray" for="product4">
			    		로투스 듀얼 (중형견 다둥이 및 45kg 내외 대형견)
				  	</label>
				</div>
				<label for="" class="font-size-14 ScoreDreamLight mt-3">*통화 가능 시간대<i class="redcircle"></i></label>		
				<div class="form-check">
					  <input class="form-check-input" type="radio"value="오전 (09:00~12:00)" name="time" id="flexRadioDefault1">
					  <label class="font-size-14 ScoreDreamLight dark_Gray" for="flexRadioDefault1">
					    	오전 (09:00~12:00)
					  </label>
				</div>
				<div class="form-check">
					  <input class="form-check-input" type="radio" value="오후 (12:00~18:00)"  name="time" id="flexRadioDefault2">
					  <label class="font-size-14 ScoreDreamLight dark_Gray" for="flexRadioDefault2">
					    	오후 (12:00~18:00)
					  </label>
				</div>
				<div class="form-check">
					  <input class="form-check-input" type="radio" value="저녁 (18:00~20:00)"  name="time" id="flexRadioDefault3">
					  <label class="font-size-14 ScoreDreamLight dark_Gray" for="flexRadioDefault3">
					    	저녁 (18:00~20:00)
					  </label>
				</div>
				<label for="privacy" class="font-size-14 ScoreDreamLight mt-3 dark_Gray">개인정보 수집 및 이용 동의<i class="redcircle"></i></label>
				<div class="form-control privacy font-size-14 ScoreDreamLight dark_Gray" id="privacy">
					회사명(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보 주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개합니다.<br>
					<br>
					<strong>제1조 (개인정보의 처리목적)</strong><br>
					회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리<br>
					회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만 아동의 개인정보처리 시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등을 목적으로 개인정보를 처리합니다.<br>
					<br>
					2. 재화 또는 서비스 제공<br>
					물품 배송, 서비스 제공, 계약서 및 청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등을 목적으로 개인정보를 처리합니다.<br>
					<br>
					3. 고충 처리<br>
					민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등의 목적으로 개인정보를 처리합니다.<br>
					<br>
					<strong>제2조 (개인정보의 처리 및 보유기간)</strong><br>
					① 회사는 법령에 따른 개인정보 보유, 이용 기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용 기간 내에서 개인정보를 처리, 보유합니다.<br>
					② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지<br>
					다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지<br>
					1) 관계 법령 위반에 따른 수사, 조사 등이 진행 중인 경우에는 해당 수사, 조사 종료 시까지<br>
					2) 홈페이지 이용에 따른 채권 및 채무관계 잔존 시에는 해당 채권, 채무 관계 정산 시까지<br>
					<br>
					<!-- 쇼핑몰 또는 예약 결제를 받지 않는다면 삭제 --><br>
					2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료 시까지<br>
					다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지<br>
					1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록<br>
					- 표시․광고에 관한 기록 : 6월<br>
					- 계약 또는 청약 철회, 대금결제, 재화 등의 공급기록 : 5년<br>
					- 소비자 불만 또는 분쟁 처리에 관한 기록 : 3년<br>
					2) 「통신비밀보호법」 제41조에 따른 통신사실확인자료 보관<br>
					- 가입자 전기통신일시, 개시․종료 시간, 상대방 가입자 번호, 사용도수, 발신기지국 위치추적자료 : 1년<br>
					- 컴퓨터 통신, 인터넷 로그 기록자료, 접속지 추적자료 : 3개월<br>
					<br>
					<!-- 수정 필요. 개인정보 제3자 제공 사용하지 않는다면 삭제 --><br>
					<strong>제3조 (개인정보의 제3자 제공)</strong><br>
					① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제 18조에 해당하는 경우에만 개인정보를 제3자에게 제공하고 그 외에는 정보주체의 개인정보를 제3자에게 제공하지 않습니다.<br>
					② 회사는 원활한 서비스 제공을 위해 다음의 경우 개인정보보호법 제17조 제1항 제1호에 따라 정보주체의 동의를 얻어 필요 최소한의 범위로만 개인정보를 제3자에게 제공할 수 있습니다.<br>
					- 개인정보를 제공받는 자 : &lt;예) (주) OOO 카드&gt;<br>
					- 제공받는 자의 개인정보 이용목적 : &lt;예) 이벤트 공동개최 등 업무제휴 및 제휴 신용카드 발급&gt;<br>
					- 제공하는 개인정보 항목 : &lt;예) 성명, 주소, 전화번호, 이메일주소, 카드결제계좌정보&gt;<br>
					- 제공받는 자의 보유, 이용기간 : &lt;예) 신용카드 발급계약에 따른 거래기간동안&gt;<br>
					<br>
					<!-- 수정 필요. 개인정보처리 위탁하는 별도 회사가 있는 경우 수정하거나 추가. 해당없는 경우 삭제 --><br>
					<strong>제4조(개인정보처리의 위탁)</strong><br>
					① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
					- 위탁업무 내용<br>
					- 위탁받는 자 (수탁자) : (주)아임웹- 위탁하는 업무의 내용 : 쇼핑몰 호스팅 서비스의 시스템 제공, 모바일 앱 서비스, 마케팅 서비스 및 부가, 제휴서비스 제공 및 알림톡, 친구톡, 문자메시지 발송대행 서비스 등<br>
					- 위탁받는 자 (수탁자) : OOO PG<br>
					- 위탁하는 업무의 내용 : 결제 및 에스크로 업무<br>
					- 위탁받는 자 (수탁자) : OOO 택배<br>
					- 위탁하는 업무의 내용 : 상품 배송 업무<br>
					- 위탁받는 자 (수탁자) : OOO 고객센터<br>
					- 위탁하는 업무의 내용 : 고객상담 업무<br>
					- 위탁받는 자 (수탁자) : OOO<br>
					- 위탁하는 업무의 내용 : 본인확인 업무<br>
					- **재위탁사**<br>
					- **재위탁받는 자(수탁자) : (주)아임웹 → 인포빕(유)**<br>
					- **위탁하는 업무의 내용 : 문자메시지 발송, 카카오톡 알림톡(정보성 메시지) 발송 업무**<br>
					- **재위탁받는 자(수탁자) : (주)아임웹 → (주)루나소프트**<br>
					- **위탁하는 업무의 내용 : 문자메시지 발송, 카카오톡 알림톡(정보성 메시지) 및 친구톡 발송 업무**<br>
					② 회사는 위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>
					③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>
					<br>
					<strong>제5조(정보주체 및 법정대리인의 권리와 그 행사 방법)</strong><br>
					<br>
					① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>
					1. 개인정보 열람 요구<br>
					2. 오류 등이 있을 경우 정정 요구<br>
					3. 삭제요구<br>
					4. 처리정지 요구<br>
					② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.<br>
					③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
					④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
					⑤ 정보주체는 개인정보 보호법 등 관계 법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니 됩니다.<br>
					<br>
					<!-- 사이트 운영 환경에 맞게 1항, 2항 수정 필요 --><br>
					<strong>제6조(처리하는 개인정보 항목)</strong><br>
					회사는 다음의 개인정보 항목을 처리하고 있습니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리<br>
					필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호&gt;<br>
					선택항목 : &lt;예) 결혼 여부, 관심 분야&gt;<br>
					<br>
					2. 재화 또는 서비스 제공<br>
					필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보 등 결제정보&gt;<br>
					선택항목 : &lt;관심분야, 과거 구매내역&gt;<br>
					<br>
					<strong>제7조(개인정보의 파기)</strong><br>
					① 회사는 개인정보 보유 기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
					② 정보주체로부터 동의받은 개인정보 보유 기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>
					③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
					1. 파기 절차<br>
					회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
					2. 파기 방법<br>
					회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
					<br>
					<strong>제8조(개인정보의 안전성 확보조치)</strong><br>
					회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 하고 있습니다.<br>
					1. 관리적 조치 : 내부관리계획 수립 및 시행, 정기적 직원 교육 등<br>
					2. 기술적 조치 : 개인정보처리시스템 등의 접근 권한 관리, 접근통제시스템 설치, 고유 식별정보<br>
					등의 암호화, 보안프로그램 설치<br>
					3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제<br>
					<br>
					<strong>제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</strong><br>
					① 회사는 이용자에게 개별적인 맞춤 서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br>
					② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며 이용자들의 PC 또는 모바일에 저장됩니다.<br>
					③ 정보주체는 웹 브라우저 옵션 설정을 통해 쿠키 허용, 차단 등의 설정을 할 수 있습니다. 다만, 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
					<br>
					▶ 웹 브라우저에서 쿠키 허용/차단<br>
					- 크롬(Chrome) : 웹 브라우저 설정 &gt; 개인정보 보호 및 보안 &gt; 인터넷 사용기록 삭제<br>
					- 엣지(Edge) : 웹 브라우저 설정 &gt; 쿠키 및 사이트 권한 &gt; 쿠키 및 사이트 데이터 관리 및 삭제<br>
					<br>
					▶ 모바일 브라우저에서 쿠키 허용/차단<br>
					- 크롬(Chrome) : 모바일 브라우저 설정 &gt; 개인정보 보호 및 보안 &gt; 인터넷 사용기록 삭제<br>
					- 사파리(Safari) : 모바일 기기 설정 &gt; 사파리(Safari) &gt; 고급 &gt; 모든 쿠키 차단<br>
					- 삼성 인터넷 : 모바일 브라우저 설정 &gt; 인터넷 사용 기록 &gt; 인터넷 사용 기록 삭제<br>
					<br>
					④ 회사는 서비스 이용과정에서 사용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부 등을  파악하여 이용자에게 최적화된 정보 제공을 위해 수집・이용하고 있습니다.<br>
					<br>
					<!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
					<strong>제10조(개인정보 보호책임자)</strong><br>
					① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만 처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
					<br>
					▶ 개인정보 보호책임자<br>
					성명 : OOO<br>
					직책 : OOO<br>
					연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
					※ 개인정보 보호 담당부서로 연결됩니다.<br>
					<br>
					▶ 개인정보 보호 담당부서<br>
					부서명 : OOO 팀<br>
					연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
					<br>
					② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만 처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.<br>
					<br>
					<!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
					<strong>제11조(개인정보 열람청구)</strong><br>
					정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람 청구가 신속하게 처리되도록 노력하겠습니다.<br>
					<br>
					▶ 개인정보 열람청구 접수․처리 부서<br>
					부서명 : OOO<br>
					연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
					<br>
					<strong>제12조(권익침해 구제 방법)</strong><br>
					정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.<br>
					1. 개인정보 분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br>
					2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br>
					3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>
					4. 경찰청 : (국번없이) 182 (ecrm.police.go.kr/minwon/main)<br>
					<br>
					<!-- 사이트 오픈일에 맞게 수정 필요 --><br>
					<strong>제13조(개인정보 처리방침 시행 및 변경)</strong><br>
					이 개인정보 처리방침은 20XX. X. X. 부터 적용됩니다.
				</div>
				<div class="form-check mt-2">
					<input class="form-check-input" type="checkbox" value="" id="checkprivacy" name="checkprivacy">
				  	<label class="font-size-14 ScoreDreamLight" for="checkprivacy">
			    		개인정보 수집 및 이용에 동의합니다.
			 	 	</label>
				</div>
				<div class="text-center my-4">
					<button type="button" class="btn btn-primary font-size-14 ScoreDreamRegular" onclick="checkInput()">신청하기</button>
					<p class="font-size-14 ScoreDreamLight my-3">▲</p>
					<p class="font-size-14 ScoreDreamLight my-0 dark_Gray">위의  <span class="bg-primary text-white px-2">신청하기</span>  버튼을 눌러주면</p>
					<p class="font-size-14 ScoreDreamLight my-0 dark_Gray">신청이 완료됩니다</p>
				</div>
			</form>
		</div>
		<div class="container-fluid px-0 my-5">
				<div class="d-none d-lg-block css_gray">
					<div class="container text-center">
						<img src="./img/rental7th/img06.jpg" alt=""  class="img-fluid"/>
					</div>
				</div>
				<div class="d-block d-lg-none">
					<img src="./img/rental7th/img06-mo.jpg" alt=""  class="img-fluid"/>
				</div>
		</div>
		<div class="container my-5">
			<p class="ScoreDreamRegular font-size-18 my-4 dark_Gray">| 유의사항</p>
			<ul class="font-size-13 ScoreDreamLight dark_Gray">
				<li>렌탈 상품은 이니렌탈(KG이니시스) 전자결제시스템을 통하여 계약이 진행 됩니다.</li>
				<li>렌탈 계약 건의 정보, 해약, 위약금 등 관련된 내용은 이니렌탈 전자결제시스템을 통해 확인이 가능합니다. (카톡 플러스친구 @이니렌탈 / 1800-1739)</li>
				<li>제품 상담 및 기타 상담은 [카톡 플러스친구 @붐펫 vuumpet] 또는 [1577-3516]으로 문의 주시면 안내가 가능합니다.</li>
				<li>박스 개봉 전 고객 변심에 의한 반품 및 취소의 경우 왕복 배송비는 고객 부담입니다.</li>
				<li>펫드라이룸 제품 특성상 개봉 후 혹은 배송 완료 후 단순 변심에 의한 반품/취소는 어려울 수 있습니다.</li>
				<li>본 이벤트는 이름, 휴대폰번호 등 필요한 개인정보에 대한 개인정보 수집 동의를 요구할 수 있으며 동의하지 않으면 이벤트 대상자에서 제외됩니다.</li>
				<li>상품권 지급은 개인정보상의 휴대폰 번호로 발송되며 재발송 불가 및 유효기간이 지나면 사용이 불가하오니 별도 고지된 기간 내 사용해 주셔야 합니다.</li>
				<li>이벤트로 진행되는 사은품 및 상품권은 계약일(배송완료) 기준으로 익월초 일괄 발송될 예정입니다.</li>
				<li>개인정보 입력 오류에 따른 오발송에 대한 책임은 응모자에게 있으므로 응모 전 반드시 개인정보를 다시 한 번 확인해 주시기 바랍니다.</li>
				<li>본 행사의 내용 및 경품은 당사 사정에 따라 예고 없이 변경될 수 있습니다.</li>
			</ul>
		</div>
		<div class="container-fluid px-0 mt-5">
			<div class="position-relative test">
				<div class="bg_img"></div>
			</div>
		</div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
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
			});
	    </script>
	    <!-- Modal -->
		<script>
			function checkInput() {
				let frm =  document.frm
				let name = frm.name.value
				let phone1 = frm.phone1.value
				let phone2 = frm.phone2.value
				let phone3 = frm.phone3.value
				let regExPhone = /^\d{3}-\d{3,4}-\d{4}$/;
				let product1 = frm.product1.checked
				let product2 = frm.product2.checked
				let product3 = frm.product3.checked
				let product4 = frm.product4.checked
				console.log(product4)
				let time1 = frm.flexRadioDefault1.checked
				let time2 = frm.flexRadioDefault2.checked
				let time3 = frm.flexRadioDefault3.checked
				let checkprivacy = frm.checkprivacy.checked
				if (!checkprivacy || !name || !frm.phone1.value || !frm.phone2.value || !frm.phone3.value || (!product1 && !product2 && !product3 && !product4) || (!time1 && !time2 && !time3)  || (!phone1 && !phone2 && !phone3)) {
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