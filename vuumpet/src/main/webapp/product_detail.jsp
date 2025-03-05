<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/product_detail.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/menu.css">
</head>
<body>
    <%@include file="menu.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");
        String idx = request.getParameter("idx");
        Database db = new Database();
        String query = "WHERE id='" + idx + "' FETCH FIRST 1 ROWS ONLY";
        Map<String, Object> productQueryResult = db.SelectQuery("vuumpet_product", query);
        boolean success = (boolean) productQueryResult.get("success");
        if (success) {
            List<String[]> productInfo = (List<String[]>) productQueryResult.get("results");
            NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
            formatter.setMinimumFractionDigits(0);
            formatter.setMaximumFractionDigits(0);
    %>
    <div class="container">
        <%
            for (String[] product : productInfo) {

        %>
        <div class="row position-relative mt-5" style="padding-top: 8px;">
            <div class="col-12 col-lg-6 float-start">
                <div class="position-relative mx-auto" style="max-width: 615px;">
                    <ul class="list-unstyled absolute-top-30px">
                    <li class="float-start">
                        <a href="/" class="text-decoration-none ScoreDreamRegular font-size-13">Home</a>
                        <i style="margin: 0px 8px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
                            </svg>
                        </i>
                    </li>
                    <%
                        String categoryId = product[7];
                        query = "WHERE id='" + categoryId + "' FETCH FIRST 1 ROWS ONLY";
                        Map<String, Object> categoryResult = db.SelectQuery("vuumpet_category", query);
                        success = (boolean) categoryResult.get("success");
                        if (success) {
                            List<String[]> categoryInfo = (List<String[]>) categoryResult.get("results");
                            for (String[] category : categoryInfo) {
                                String categoryName = category[1];
                                String categoryLink = category[2];
                    %>
                    <li class="float-start">
                        <a href="<%=categoryLink%>" class="text-decoration-none active ScoreDreamRegular font-size-13"><%=categoryName%></a>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
                    <img src="<%= product[2]%>" alt="" class="img-fluid"/>
                </div>
            </div>
            <div class="col-12 col-lg-6 float-start">
                <div class="position-relative mx-auto" style="max-width: 615px;">
                    <div class="product-title">
                        <p class="ScoreDreamLight font-size-14 mb-0 "><%=product[1]%></p>
                        <p class="price ScoreDreamRegular mb-0"><%=formatter.format(Integer.parseInt(product[3])) + "원"%></p>
                    </div>
                    <div class="product-info"><%=product[4]%></div>
					<%
                            query = "WHERE product_id='" + product[0] + "'";
                            Map<String, Object> optionResult = db.SelectQuery("vuumpet_product_option", query);
                            success = (boolean) optionResult.get("success");
                            if (success) {
                                List<String[]> optionResults = (List<String[]>) optionResult.get("results");
                                for (String[] option : optionResults) {
                                    String optionId = option[0];
                                    String option_name = option[2];
                                    String is_required = option[3];
                        %>
                        <div class="select-wrap">
                            <div class="option-title">
                            	<p class="mb-0"> 
                            		<%=option_name%>
                           		   <% if (is_required.equals("1")) { %>
	                                    <span class="option_require">*</span>
	                                <% } %>
                            	</p>
                              
                             
                            </div>
                            <a class="css-dropdown-toggle" role="button" >
                                <%=option_name%> <%=is_required.equals("1") ? "(필수)" : ""%>
                            </a>
                            <div class="css-dropdown-menu" data-option="<%=optionId%>" style="display: none;">
                                <%
                                    query = "WHERE option_id='" + optionId + "'";
                                    Map<String, Object> optionValueResult = db.SelectQuery("vuumpet_product_option_value", query);
                                    success = (boolean) optionValueResult.get("success");
                                    if (success) {
                                        List<String[]> optionValueResults = (List<String[]>) optionValueResult.get("results");
                                        for (String[] optionValue : optionValueResults) {
                                            String option_value = optionValue[2];
                                            String option_stock = optionValue[3];
                                            String option_price = optionValue[4];
                                %>
                                <div class="css-dropdown-item" >
                                    <a>
                                        <span class="d-block"><%=option_value%></span>
                                        <span class="d-block"><strong><%=formatter.format(Integer.parseInt(option_price)) + "원"%></strong></span>
                                    </a>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <%
                                } // option 반복문 종료
                            } // optionResult success 종료
                        %>
               		<div class="buy_btns">
               			<button class="buy">구매하기</button>
              				<button class="gift" >선물하기</button>
              				<button class="cart">장바구니</button>
                   	</div>
                </div>
            </div>
   			<div class="col-12">
   				<ul class="d-flex justify-content-center align-items-center list-unstyled ScoreDreamRegular font-size-13">
   					<li><a href="" class="text-decoration-none">상세정보</a></li>
   					<li><a href="" class="text-decoration-none">구매평</a></li>
   					<li><a href="" class="text-decoration-none">Q&A</a></li>
   				</ul>
   			</div>
   			<div class="col-12">
   				<%=product[5] %>
   			</div>
        </div>
        <%
            } // for 루프 종료
        %>
    </div>
    <%
        } // if (success) 종료
    %>
    <%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="./js/nav.js"></script>
    <script>
        $(function(){
            get_nav();
            $(window).on("resize", function(e){
                get_nav();
            });
            $('.css-dropdown-toggle').on('click', function() {
                let optionId = $(this).closest('.select-wrap').find('.css-dropdown-menu').data('option');
                dropdownToggle(optionId, $(this));
            });
            $('img[src^="/vuumpet/uploads/"]').addClass('img-fluid');
        });
        function dropdownToggle(optionId, toggleElement) {
            let element = $(`[data-option="\${optionId}"]`);
            let nextElement = toggleElement.closest('.select-wrap').find('.css-dropdown-menu'); // 올바른 다음 요소
            if (element.length) {
                element.toggle();
                if (toggleElement.hasClass('border-color')) {
                    toggleElement.removeClass('border-color'); // 클래스가 있으면 제거
                    nextElement.removeClass('border-color');
                    toggleElement.removeClass('open');
                }else{
                    toggleElement.addClass('border-color'); // 클래스가 있으면 제거
                    nextElement.addClass('border-color');
                    toggleElement.addClass('open');
                }
            } 
		}
    </script>
</body>
</html>