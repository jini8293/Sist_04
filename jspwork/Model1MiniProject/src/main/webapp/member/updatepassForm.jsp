<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<%
String num = request.getParameter("num");
%>
<body>
	<div style="margin: 200px 200px;">
		<form action="member/updatepassAction.jsp" method="post">
			<h4>비밀번호</h4>
			<input type="password" class="form-control" name="pass"
				required="required" placeholder="숫자 4자리" style="width: 190px;">

			<input type="hidden" name="num" value="<%=num%>"> <br>
			<button type="submit" class="btn btn-danger">이동</button>
			<button type="button" class="btn btn-outline-dark"
				onclick="history.back()">이전</button>
		</form>
	</div>


</body>
</html>