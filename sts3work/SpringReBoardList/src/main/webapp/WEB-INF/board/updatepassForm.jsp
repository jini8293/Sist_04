<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<div style="margin: 100px 100px;">
	<form action="updatepass" method="post">
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		
		<div class="alert alert-info" style="font-size: 1.3em; width: 350px;">
			<b>비밀번호를 입력해 주세요</b>
		</div>
		<div class="d-inline-flex">
			<input type="password" name="pass" class="from-control" style="width: 130px;" required="required"> 
			<button type="submit" class="btn btn-danger" style="margin-left: 10px;">GO</button>
			<button type="button" class="btn btn-outline-info" onclick="history.back()" style="margin-left: 10px;">BACK</button>
		</div>
	</form>
</div>
</body>
</html>