<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
        String id = (String)(session.getAttribute("id"));
%>
<header>
    <nav class="navbar navbar-expand-md css_nav_color fixed-top ScoreDreamLight dark_Gray pt-0 pb-0">
        <div class="container-fluid px-3 justify-content-center align-items-center" style="height: 70px;"> <%-- px-0 → px-3 --%>
            <button class="navbar-toggler button-left ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="fa-sharp fa-solid fa-bars"></span>
            </button>
            <a class="navbar-brand py-0" href="index.jsp">
                <img src="./img/logo.png" alt="" class="">
            </a>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body d-md-flex align-items-md-center">
                    <div class="d-md-flex align-items-lg-center w-100">
                        <%-- 왼쪽 정렬 메뉴 그룹 --%>
                        <ul id="main-nav-items" class="navbar-nav gap16">
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
                        </ul>
                        <%-- 오른쪽 정렬 메뉴 그룹 --%>
                        <ul id="right-menu" class="navbar-nav gap16 ms-md-auto me-md-3"> <%-- ms-lg-auto, me-lg-3 추가 --%>
                            <c:choose>
                                <c:when test="${empty id}">
                                    <li class="nav-item nav-item-no-hide">
                                        <a class="nav-link" href="site_join_agree.jsp">회원가입</a>
                                    </li>
                                    <li class="nav-item nav-item-no-hide">
                                        <a class="nav-link" href="login.jsp">로그인</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item nav-item-no-hide">
                                        <a class="nav-link" href="logout.jsp">로그아웃</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li class="nav-item nav-item-no-hide">
                                <a class="nav-link" href="shop_cart.jsp">장바구니</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>