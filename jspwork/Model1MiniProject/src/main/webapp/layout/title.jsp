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
<title>Insert title here</title>

</head>
<%
//프로젝트 경로
String root = request.getContextPath();
%>
<body>
	<div>

		<a href="<%=root%>" style="color: black; text-decoration: none;"><img
			src="<%=root%>/image/unmbbo.png" width="130"> &nbsp;&nbsp;JSP &
			JQUERY MINI PROJECT</a>

	<span style="margin-left: 400px;">
	<button type="button"
		onclick="location.href='index.jsp?main=login/loginForm.jsp'"
		class="btn btn-outline-danger" >로그인</button>
		</span>
		</div>
</body>
</html>