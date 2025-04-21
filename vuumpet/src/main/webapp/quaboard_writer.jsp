<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userId = (String)session.getAttribute("id");
    if (userId == null || userId.isEmpty()) {
        response.sendRedirect("./login.jsp"); 
        return; 
    }
%>
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
		<style>
      
    	</style>
  </head>
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
	      <div class="container mt-5 mb-5">
        <h2>게시글 작성</h2>
        <hr>

        <form action="./quaboard_add_process.jsp" method="post" id="boardForm">

            <div class="mb-3">
                <label for="postTitle" class="form-label fw-bold">제목</label>
                <input type="text" class="form-control" id="postTitle" name="title" placeholder="제목을 입력하세요." required>
            </div>
			<%-- 관리자일 경우에만 공지사항 체크박스 표시 --%>
		    <c:if test="${sessionUserId == 'admin'}"> <%-- 실제 관리자 ID 또는 권한 확인 로직으로 변경 --%>
		        <div class="mb-3 form-check">
		            <input type="checkbox" class="form-check-input" id="isNotice" name="is_notice" value="1">
		            <label class="form-check-label" for="isNotice">공지사항으로 등록</label>
		        </div>
		    </c:if>
		
		    <div class="mb-3 form-check">
		        <input type="checkbox" class="form-check-input" id="isSecret" name="is_secret" value="1">
		        <label class="form-check-label" for="isSecret">비밀글로 작성</label>
		    </div>
            <div class="mb-3">
                <label for="editor" class="form-label fw-bold">내용</label>
                <div id="editor">
                    <p>여기에 내용을 입력하세요.</p>
                </div>
                <input type="hidden" name="content" id="postContent">
            </div>

            <div class="d-flex justify-content-end gap-2">
                <a href="./quaboard.jsp" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>

        </form>
    </div>
     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	     <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
	    <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/translations/ko.js"></script>
	
	    <script>
	        let ckEditorInstance; // 에디터 인스턴스 접근용 변수
	
	        ClassicEditor
	            .create( document.querySelector( '#editor' ), {
	                // 언어 설정 (한국어팩 로드 시)
	                language: 'ko',
	
	                // 툴바 설정: 요청하신 기능 위주로 구성
	                toolbar: {
	                    items: [
	                        'bold',          // 굵게
	                        'italic',        // 기울임
	                        'underline',     // 밑줄
	                        'strikethrough', // 취소선
	                        '|',             // 구분선
	                        'fontColor',        // 글자색
	                        'fontBackgroundColor',// 글자 배경색
	                        '|',
	                        'alignment',     // 텍스트 정렬 (왼쪽, 가운데, 오른쪽, 양쪽)
	                        '|',
	                        'imageUpload',   // 이미지 업로드
	                        '|',
	                        'undo',          // 되돌리기
	                        'redo'           // 다시 실행
	                        // 필요에 따라 'link', 'numberedList', 'bulletedList' 등 추가 가능
	                    ]
	                },
	
	                // 이미지 툴바 설정 (이미지 클릭 시 나타나는 옵션)
	                image: {
	                    toolbar: [
	                        'imageStyle:inline', // 인라인
	                        'imageStyle:block',  // 블록 (기본)
	                        'imageStyle:side',   // 텍스트와 함께 (Side image)
	                        '|',
	                        'toggleImageCaption', // 캡션 토글
	                        'imageTextAlternative' // 대체 텍스트
	                    ]
	                },
	
	                // *** 중요: 이미지 업로드 설정 (SimpleUploadAdapter) ***
	                // 서버 측 업로드 구현이 필요합니다.
	                simpleUpload: {
	                    // uploadUrl: 실제 이미지 업로드를 처리할 서버의 URL을 입력해야 합니다.
	                    // 이 서버 URL은 이미지 파일을 받아서 저장하고,
	                    // JSON 형식으로 {"url": "저장된_이미지_경로"} 를 반환해야 합니다.
	                    // 예: uploadUrl: '/uploadImage.jsp' 또는 '/api/image/upload'
	                    uploadUrl: './admin/uploadImage.jsp',
	
	                    // 필요에 따라 헤더 설정 (예: 인증 토큰)
	                    // headers: {
	                    //     'Authorization': 'Bearer your-token'
	                    // }
	                }
	            } )
	            .then( editor => {
	                console.log( 'CKEditor5 초기화 성공', editor );
	                ckEditorInstance = editor; // 생성된 에디터 인스턴스 저장
	
	                // 폼 제출 시 에디터 내용을 hidden input에 복사하는 로직
	                const boardForm = document.getElementById('boardForm');
	                const postContent = document.getElementById('postContent');
	                if (boardForm && postContent) {
	                    boardForm.addEventListener('submit', function(event) {
	                        // 에디터의 현재 내용을 가져와 hidden input의 value로 설정
	                        postContent.value = ckEditorInstance.getData();
	                        // 여기서 추가적인 유효성 검사 등을 수행할 수 있습니다.
	                        // console.log('제출 내용:', postContent.value);
	                    });
	                }
	            } )
	            .catch( error => {
	                console.error( 'CKEditor5 초기화 중 오류 발생:', error );
	            } );
	    </script>
	    
	    <script src="./js/nav.js"></script>
	</body>	
</html>