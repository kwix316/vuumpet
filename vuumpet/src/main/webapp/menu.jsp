<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
        String id = (String)(session.getAttribute("id"));
%>
<header>
    <nav class="navbar navbar-expand-md css_nav_color fixed-top ScoreDreamLight dark_Gray pt-0 pb-0">
        <div class="container-fluid px-0 justify-content-center align-items-center" style="height: 70px;">
            <%-- Toggler, Brand 등은 동일 --%>
            <button class="navbar-toggler button-left ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="fa-sharp fa-solid fa-bars"></span>
            </button>
            <a class="navbar-brand mx-auto py-0" href="index.jsp">
                <img src="./img/logo.png" alt="" class="">
            </a>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <%-- offcanvas-body 또는 navbar 내부 구조를 flex로 만들어 두 ul을 정렬 --%>
                <%-- 예시: d-flex justify-content-between 사용 (상황에 맞게 조정 필요) --%>
                <div class="offcanvas-body d-lg-flex justify-content-lg-between"> <%-- Large 스크린에서 flex 적용 --%>

                    <%-- 1. 왼쪽 정렬 메뉴 그룹 --%>
                    <ul id="main-nav-items" class="navbar-nav justify-content-start flex-grow-1 pe-3 flex-nowrap"> <%-- 기존 ul 유지 --%>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="7thdryroom.jsp">펫드라이룸 7세대</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="rental7th.jsp">렌탈상담</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quaboard.jsp">제품문의</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.jsp">전체 상품</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="review.jsp">제품리뷰</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="support.jsp">고객지원</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aboutus.jsp">브랜드</a>
                        </li>
                        <%-- 오른쪽 정렬될 항목들은 여기에서 제거 --%>
                    </ul>

                    <%-- 2. 오른쪽 정렬 메뉴 그룹 --%>
                    <ul id="right-menu" class="navbar-nav flex-nowrap"> <%-- 새 ul 추가, ms-auto/ms-lg-auto 는 필요 없을 수 있음 (부모 flex 설정에 따라) --%>
                        <c:choose>
                            <c:when test="${empty id}">
                                <%-- 로그인 안했을 때 --%>
                                <li class="nav-item nav-item-no-hide"> <%-- ms-lg-auto 제거, nav-item-no-hide 는 JS가 이 ul을 건드리지 않으면 불필요 --%>
                                    <a class="nav-link" href="site_join_agree.jsp">회원가입</a>
                                </li>
                                <li class="nav-item nav-item-no-hide">
                                    <a class="nav-link" href="login.jsp">로그인</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <%-- 로그인 했을 때 --%>
                                <li class="nav-item nav-item-no-hide"> <%-- ms-lg-auto 제거 --%>
                                    <a class="nav-link" href="logout.jsp">로그아웃</a>
                                </li>
                                <%-- <li class="nav-item nav-item-no-hide"> <a ...>마이페이지</a> </li> --%>
                            </c:otherwise>
                        </c:choose>

                        <li class="nav-item nav-item-no-hide">
                            <a class="nav-link" href="shop_cart.jsp">장바구니</a>
                        </li>
                    </ul>

                </div> <%-- /.offcanvas-body or flex container --%>
            </div> <%-- /.offcanvas --%>
        </div> <%-- /.container-fluid --%>
    </nav>
</header>