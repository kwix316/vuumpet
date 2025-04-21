<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- JSTL core 태그 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- JSTL formatting (날짜 등) --%>
<%@ page import="sql.Database" %> <%-- Database 클래스 임포트 --%>
<%@ page import="java.util.*" %> <%-- List, Map 임포트 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    // --- 페이징 처리 ---
    int currentPage = 1; // 기본 페이지
    int postsPerPage = 10; // 페이지 당 보여줄 글 수 (공지 제외)
    int pagesPerBlock = 10; // 한 블록에 보여줄 페이지 수

    // 요청 파라미터에서 현재 페이지 가져오기
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            currentPage = 1; // 잘못된 파라미터면 1페이지로
        }
    }

    // --- 데이터베이스에서 목록 및 전체 개수 가져오기 ---
    Database db = new Database();
    Map<String, Object> qnaData = db.getQnaList(currentPage, postsPerPage);
    List<Map<String, Object>> posts = (List<Map<String, Object>>) qnaData.get("posts");
    int totalPosts = (int) qnaData.get("totalPosts");

    // --- 페이지네이션 계산 ---
    int totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);
    int startPage = ((currentPage - 1) / pagesPerBlock) * pagesPerBlock + 1;
    int endPage = Math.min(startPage + pagesPerBlock - 1, totalPages);

    // --- JSP에서 사용하기 위해 request scope에 저장 ---
    request.setAttribute("posts", posts);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("startPage", startPage);
    request.setAttribute("endPage", endPage);
    request.setAttribute("pagesPerBlock", pagesPerBlock); // 필요시 사용

    // --- 로그인 사용자 ID 가져오기 (비밀글 처리용) ---
    String sessionUserId = (String) session.getAttribute("id");
    request.setAttribute("sessionUserId", sessionUserId); // JSTL에서 사용할 수 있도록
%>
<!doctype html>
<html lang="ko"> <%-- lang="en" -> lang="ko" 변경 --%>
  	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>제품 문의 게시판</title> <%-- 타이틀 변경 --%>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="./css/font.css">
	    <link rel="stylesheet" href="./css/quaboard.css">
	    <link rel="stylesheet" href="./css/footer.css">
   	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"> <%-- Font Awesome 버전 확인 및 수정 --%>
		<link rel="stylesheet" href="./css/menu.css">
		   <style>
            /* 테이블 컬럼 너비 조절 (필요시) */
            .col-no { width: 8%; }
            .col-title { width: auto; } /* 제목은 가변 너비 */
            .col-writer { width: 12%; }
            .col-date { width: 15%; }

            /* 링크 기본 스타일 */
            a.board-link { text-decoration: none; color: inherit; }
            a.board-link:hover { text-decoration: underline; }
            /* 공지사항 강조 (예시) */
            .notice-row { background-color: #f8f9fa; }
            .notice-row .board-link { font-weight: bold; }
            .writer-mask { font-size: 0.9em; color: #6c757d; } /* 작성자 마스킹 스타일 */
        </style>
  </head>
  	<body>
	    <%@include file="menu.jsp" %>
	    <%-- ... (상단 배너 및 소개 부분은 동일) ... --%>
        <div class="container-fluid px-0 position-relative py-140 d-none d-lg-block mb-5">
	    	<div class="bg"></div>
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

	    <div class="container mt-5">
		    <%-- 게시글 목록 테이블 --%>
		    <table class="table table-hover align-middle">
		        <thead class="table-light">
		            <tr>
		                <th scope="col" class="text-center col-no">No</th>
		                <th scope="col" class="text-start col-title">제목</th>
		                <th scope="col" class="text-center col-writer">글쓴이</th>
		                <th scope="col" class="text-center col-date">작성시간</th>
		            </tr>
		        </thead>
		       <tbody>
				    <%-- JSTL을 사용하여 게시글 목록 반복 출력 --%>
				    <c:choose>
				        <c:when test="${empty posts}">
				            <tr>
				                <td colspan="4" class="text-center py-5">등록된 문의글이 없습니다.</td>
				            </tr>
				        </c:when>
				        <c:otherwise>
				            <c:forEach var="post" items="${posts}">
				                <%-- qna_is_notice 값에 따라 notice-row 클래스 적용 --%>
				                <tr class="${post.QNA_IS_NOTICE == 1 ? 'notice-row' : ''}">
				                    <td class="text-center">
				                        <%-- 공지사항이면 아이콘, 아니면 글번호 표시 --%>
				                        <c:choose>
				                            <c:when test="${post.QNA_IS_NOTICE == 1}">
				                                <i class="fa-solid fa-bullhorn"></i>
				                            </c:when>
				                            <c:otherwise>
				                                ${post.QNA_ID}
				                            </c:otherwise>
				                        </c:choose>
				                    </td>
				                    <td>
				                        <%-- 비밀글 아이콘 처리 (이전과 동일) --%>
				                        <c:if test="${post.QNA_IS_SECRET == 1}">
				                            <i class="fa-solid fa-lock text-secondary me-1"></i>
				                        </c:if>
				
				                        <%-- 제목 링크 처리 (비밀글 여부 및 권한 확인) --%>
				                        <c:choose>
				                             <%-- 비밀글 잠금 조건: 비밀글이고, 내가 쓴 글도 아니고, 관리자도 아닐 때 --%>
				                             <c:when test="${post.QNA_IS_SECRET == 1 && post.USER_ID != sessionUserId && sessionUserId != 'admin'}"> <%-- 관리자 ID 확인 로직 주의! --%>
				                                 <a href="#" onclick="alert('비밀글은 작성자만 볼 수 있습니다.'); return false;" class="board-link">비밀글입니다.</a> <%-- 혹은 비밀번호 입력 폼으로 연결 --%>
				                             </c:when>
				                             <c:otherwise>
				                                 <%-- 정상적인 제목 링크 (상세보기 페이지로 연결) --%>
				                                 <a href="./quaboard_view.jsp?qna_id=${post.QNA_ID}" class="board-link ${post.QNA_IS_NOTICE == 1 ? 'fw-bold' : ''}">${post.QNA_TITLE}</a>
				                             </c:otherwise>
				                         </c:choose>
				                    </td>
				                   <td class="text-center">
									    <c:set var="email" value="${post.USER_EMAIL}" />
									    <c:set var="emailParts" value="${fn:split(email, '@')}" />
									    <c:set var="emailId" value="${emailParts[0]}" />
									    
									    <c:choose>
									        <%-- 관리자 처리: 이메일이 admin@vuumpet.com인 경우 --%>
									        <c:when test="${email == 'admin'}">
									            관리자
									        </c:when>
									        <%-- 이메일 마스킹: 앞 3자리 + *** 또는 1자리 + *** --%>
									        <c:when test="${fn:length(emailId) > 3}">
									            ${fn:substring(emailId, 0, 3)}<span class="writer-mask">***</span>
									        </c:when>
									        <c:otherwise>
									            ${fn:substring(emailId, 0, 1)}<span class="writer-mask">***</span>
									        </c:otherwise>
									    </c:choose>
									</td>
				                    <td class="text-center">
				                        <fmt:formatDate value="${post.QNA_REGDATE}" pattern="yyyy-MM-dd"/>
				                    </td>
				                </tr>
				            </c:forEach>
				        </c:otherwise>
				    </c:choose>
				</tbody>
		    </table>

		    <%-- 글쓰기 버튼 (로그인 여부 확인 추가 - 방법 2 적용 예시) --%>
            <div class="d-flex justify-content-end mb-3">
                 <c:choose>
                     <c:when test="${not empty sessionUserId}">
                         <a href="./quaboard_writer.jsp" class="btn btn-primary">글쓰기</a>
                     </c:when>
                     <c:otherwise>
                         <button type="button" class="btn btn-primary" onclick="alert('글쓰기는 로그인이 필요합니다.\n로그인 페이지로 이동합니다.'); window.location.href='login.jsp';">글쓰기</button>
                     </c:otherwise>
                 </c:choose>
             </div>

		    <%-- 페이지네이션 (동적 생성) --%>
		    <nav aria-label="Page navigation">
		        <ul class="pagination justify-content-center">
		            <%-- 이전 페이지 블록 버튼 --%>
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="./quaboard.jsp?page=${startPage - 1}" aria-label="Previous Block">
		                        <span aria-hidden="true">&lt;</span> <%-- 혹은 &laquo; --%>
		                    </a>
		                </li>
		            </c:if>
                    <c:if test="${startPage == 1}">
		                <li class="page-item disabled">
		                    <a class="page-link" href="#" aria-label="Previous Block">
		                        <span aria-hidden="true">&lt;</span>
		                    </a>
		                </li>
		            </c:if>

		            <%-- 페이지 번호 목록 --%>
		            <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
		                <li class="page-item ${pageNum == currentPage ? 'active' : ''}" ${pageNum == currentPage ? 'aria-current="page"' : ''}>
		                    <a class="page-link" href="./quaboard.jsp?page=${pageNum}">${pageNum}</a>
		                </li>
		            </c:forEach>

		            <%-- 다음 페이지 블록 버튼 --%>
		            <c:if test="${endPage < totalPages}">
		                <li class="page-item">
		                    <a class="page-link" href="./quaboard.jsp?page=${endPage + 1}" aria-label="Next Block">
		                        <span aria-hidden="true">&gt;</span> <%-- 혹은 &raquo; --%>
		                    </a>
		                </li>
		            </c:if>
                     <c:if test="${endPage == totalPages}">
		                <li class="page-item disabled">
		                    <a class="page-link" href="#" aria-label="Next Block">
		                        <span aria-hidden="true">&gt;</span>
		                    </a>
		                </li>
		            </c:if>
		        </ul>
		    </nav>

		</div> <%-- End of container --%>

     	<%@include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	    <script src="./js/nav.js"></script>
	</body>
</html>