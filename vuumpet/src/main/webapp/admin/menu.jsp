<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 		String id = (String)(session.getAttribute("id"));
 %>   
<header>
	<nav class="navbar navbar-expand-sm menu_color ScoreDreamLight dark_Gray pt-0 pb-0">
	  	<div class="container-fluid px-0" style="height: 70px;">
  			<button class="navbar-toggler button-left ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
	      		<span class="fa-sharp fa-solid fa-bars"></span>
	   	 	</button>
		    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		      	<div class="offcanvas-header">
			        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		      	</div>
		      	<div class="offcanvas-body">
			        <ul class="navbar-nav justify-content-center flex-grow-1 pe-3 flex-nowrap">
			          	<li class="nav-item">
	                		<a class="nav-link" href="rentallist.jsp">렌탈 상담 신청 리스트</a>
		                </li>
		                <li class="nav-item">
		                	<a class="nav-link" href="products.jsp">제품 리스트 </a>
		                </li>
                      	 <li class="nav-item">
		                	<a class="nav-link" href="category.jsp">카테고리 리스트 </a>
		                </li>
			          	<!-- <li class="nav-item dropdown">
				            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	사용자 메뉴
				            </a>
				            <ul class="dropdown-menu">
				              	<li><a class="dropdown-item" href="#">회원가입</a></li>
				              	<li><a class="dropdown-item" href="#">로그인</a></li>
				              	<li>
					                <hr class="dropdown-divider">
				              	</li>
				              	<li><a class="dropdown-item" href="#">장바구니</a></li>
				            </ul>
			          	</li> -->
			        </ul>
	      		</div>	
		    </div>
	  	</div>
	</nav>
</header>