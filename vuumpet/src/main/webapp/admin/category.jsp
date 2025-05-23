<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="menu.css">
</head>
<body>
    <%@include file="menu.jsp" %>
    <%
        Database db = new Database();
        Map<String, Object> queryResult = db.SelectQuery("vuumpet_category", "");
        boolean success = (boolean) queryResult.get("success");

        if (!success) {
    %>
        <script>
            alert("데이터베이스 오류");
        </script>
    <%
        } else {
            List<String[]> results = (List<String[]>) queryResult.get("results"); 
    %>
    <div class="container-fluid">
    	 <table class="table">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>링크</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (String[] category : results) {
                %>
                    <tr>
                        <td><%= category[1] %></td>
                        <td><%= category[2] %></td> 
                        <td><button class="btn btn-danger"  onclick="editcategory('<%=category[0] %>')">수정</button></td>
                        <td><button class="btn btn-danger"  onclick="delcategory('<%=category[0] %>')">삭제</button></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
       <div class="d-grid gap-2">
		  <a class="btn btn-primary" href="addCategory.jsp">추가</a>
		</div>
    </div>
    <%
        }
    %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		function delcategory(id) {
			 if (confirm("정말로 삭제하시겠습니까?")) {
		            $.ajax({
		                url: 'deleteCategory.jsp',
		                type: 'POST',
		                data: { id: id },
		                success: function(response) {
		                    if (response.success) {
		                        alert("삭제되었습니다.");
		                        location.reload(); 
		                    } else {
		                        alert("삭제 실패: " + response.message);
		                    }
		                },
		                error: function() {
		                    alert("서버 오류가 발생했습니다.");
		                }
		            });
		        }
		}
	</script>
</body>
</html>
