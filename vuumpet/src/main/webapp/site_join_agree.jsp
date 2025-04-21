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
	    <link rel="stylesheet" href="./css/site_join_agree.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="./css/menu.css">
  	<body>
	    <%@include file="menu.jsp" %>
	    <div class="container-fluid">
	    	<img src="./img/site_join_agree/img01.jpg" alt="" class="d-none d-lg-block img-fluid"/>
	    	<div class="container">
	    		<h4 class="ScoreDreamRegular my-5 d-block d-lg-none">봄펫 회원가입 동의</h4>
    			<form action="site_join.jsp" method="get" name="frm">
    				<div class="form-check mt-2">
						<input class="form-check-input" type="checkbox" value="" id="checkall" onchange="test()">
					  	<label class="font-size-14 ScoreDreamLight" for="checkall">
				    		이용약관, 개인정보 수집 및 이용에 모두 동의합니다.
				 	 	</label>
				 	 	
					</div>
					<div class="form-check mt-2">
				 	 	<input class="form-check-input" type="checkbox" id="policy_agree" name="policy_agree" value="ok" required>
				 	 	<label class="font-size-14 ScoreDreamLight" for="policy_agree">
				    		이용약관 동의 <span class="red">(필수)</span>
				 	 	</label>
					</div>
					<div class="form-control privacy font-size-14 ScoreDreamLight dark_Gray">
						제1조 목적<br>
						<br>
						이용약관은 “vuumpet”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.<br>
						<b본 r>
						제2조 용어의 정의<br>
						<br>
						본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.<br>
						<br>
						① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
						② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
						③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
						④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
						⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
						⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.<br>
						<br>
						제3조 약관외 준칙<br>
						<br>
						운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.<br>
						<br>
						제4조 이용계약 체결<br>
						<br>
						① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
						② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.<br>
						<br>
						제5조 서비스 이용 신청<br>
						<br>
						① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.<br>
						② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.<br>
						<br>
						제6조 개인정보처리방침<br>
						<br>
						사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
						운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다.<br>
						<br>
						회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
						<br>
						단, 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
						운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련기관의 요청이 있을시 회원의 자료를 열람 및 해당-<br>
						① 회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다. 한편, 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
						② 해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.<br>
						<br>
						제11조 서비스 이용 제한<br>
						<br>
						회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
						① 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위<br>
						② 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
						③ 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
						④ 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
						⑤ 다른 회원의 ID를 부정하게 사용하는 행위<br>
						⑥ 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
						⑦ 범죄와 결부된다고 객관적으로 판단되는 행위<br>
						⑧ 기타 관련 법령에 위배되는 행위<br>
						<br>
						제12조 게시물의 관리<br>
						<br>
						① 사이트의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다.<br>
						한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원스스로 본 이용약관에서 위배되는 게시물은 게재해서된 안됩니다.<br>
						② 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동 할 수 있습니다.<br>
						③ 불량게시물의 판단기준은 다음과 같습니다.<br>
						- 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>
						- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
						- 불법복제 또는 해킹을 조장하는 내용인 경우<br>
						- 영리를 목적으로 하는 광고일 경우<br>
						- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
						- 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
						- 기타 관계법령에 위배된다고 판단되는 경우<br>
						④ 사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.<br>
						<br>
						제13조 게시물의 보관<br>
						<br>
						사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.<br>
						<br>
						제14조 게시물에 대한 저작권<br>
						<br>
						① 회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 사이트는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.<br>
						② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br>
						③ 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.<br>
						<br>
						제15조 손해배상<br>
						<br>
						① 본 사이트의 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
						② 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.<br>
						<br>
						제16조 면책<br>
						<br>
						① 운영자는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
						② 운영자는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다<br>
						③ 운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
						④ 운영자는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
						⑤ 운영자는 회원 상호간 또는 회원과 제3자 상호간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.<br>
						⑥ 운영자는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.<br>
						⑦ 운영자는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.<br>
						⑧ 운영자는 시삽의 귀책사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.<br>
						⑨ 운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안관련 업체에 의해 대응방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.<br>
						<br>
						제 17조(카카오 알림톡 시행에 관한 내용)<br>
						제롬("회사")은 신규 회원의 전화번호수집 양식 및 기존 회원 대상의 공지 이메일 등을 통해 안내 주문, 배송 정보 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, 만약 알림톡 수신이 불가능 하거나 수신 차단하신 경우에는 일반 문자 메시지로 보내드립니다. 와이파이 아닌 이동통신망으로 접속시 알림톡 수신 중 데이터 요금이 발생할 수 있습니다. 알림톡과는 다른 방식으로 정보 수신을 원하시면 알림톡을 차단해주세요<br>
						<br>
						부칙<br>
						<br>
						이 약관은 2019년 9월 1일부터 시행합니다.					
					</div>
					<div class="form-check mt-4">
				 	 	<input class="form-check-input" type="checkbox" id="privacy_agree" name="privacy_agree" value="ok" required>
				 	 	<label class="font-size-14 ScoreDreamLight" for="privacy_agree">
				    		개인정보 수집 및 이용 동의 <span class="red">(필수)</span>
				 	 	</label>
					</div>
					<div class="form-control privacy font-size-14 ScoreDreamLight dark_Gray">
						<strong style="color: black;">1. 개인정보 수집목적 및 이용목적</strong><br>
						<br>
						(1) 홈페이지 회원 가입 및 관리<br>
						회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등의 목적<br>
						<br>
						(2) 재화 또는 서비스 제공<br>
						물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제 및 정산, 채권추심 등의 목적<br>
						<br>
						(3) 고충처리<br>
						민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등<br>
						<br>
						<strong class="black">2. 수집하는 개인정보 항목</strong><br>
						ID, 성명, 비밀번호, 주소, 휴대폰번호, 이메일, 14세 미만 가입자의 경우 법정대리인 정보<br>
						<br>
						<strong class="black">3. 개인정보 보유 및 이용기간</strong><br>
						<strong class="black">회원탈퇴 시까지</strong> (단, 관계 법령에 보존 근거가 있는 경우 해당 기간 시까지 보유, 개인정보처리방침에서 확인 가능)									
					</div>
					<label class="font-size-14 ScoreDreamLight mt-4" for="ar">마케팅 활용 동의 및 광고 수신 동의</label>
					<div class="form-control privacy font-size-14 ScoreDreamLight dark_Gray" id="ar">
						서비스와 관련된 신상품 소식, 이벤트 안내, 고객 혜택 등 다양한 정보를 제공합니다.							
					</div>
					<div class="form-check">
				 	 	<input class="form-check-input" type="checkbox" id="marketing_sms_agree" name="marketing_sms_agree" value="ok">
				 	 	<label class="font-size-14 ScoreDreamLight" for="marketing_sms_agree">
				    		SMS 수신 동의 <span class="ligray">(선택)</span>
				 	 	</label>
					</div>
					<div class="form-check mt-3">
				 	 	<input class="form-check-input" type="checkbox" id="limit_join_agree" name="limit_join_agree" value="ok" required>
				 	 	<label class="font-size-14 ScoreDreamLight" for="limit_join_agree" >
				    		만 14세 이상입니다. <span class="red">(필수)</span>
				 	 	</label>
					</div>
					<div class="text-center my-5">
						<button class="btn btn-dark" type="submit">가입하기</button>
					</div>
					
    			</form>
	    	</div>
	    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	    <script src="./js/nav.js"></script>
	    <script>
	    	function test() {
				const checkall = $("#checkall")
				if(checkall.prop("checked")){
					$('input[type="checkbox"]').prop("checked", true);
				}else{
					$('input[type="checkbox"]').prop("checked", false);
				}
				  
			}
	    </script>
	</body>	
</html>