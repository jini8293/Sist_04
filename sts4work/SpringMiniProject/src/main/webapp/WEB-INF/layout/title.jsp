<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.login{
		position: absolute;
		left: 800px;
		top: 35px;
		width: 350px;
	}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="/">
		<img alt="" src="${root }/image/oliveyoungtitle.jpg" style="width: 200px; margin-top: 30px;">	
	</a>
	<div class="login">
		<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='${root}/login/form'">Login</button>
	</div>
</body>
</html>