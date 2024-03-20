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
<%

	//프로젝트 경로
	String root = request.getContextPath();

%>
</head>
<body>
	<div style="font-size: 13pt; line-height: 25px;">
		<img src="<%=root%>/image/unmbbo2.jpg" width="200"><br><br>
		<i class="bi bi-person-fill"></i></i> 캐릭터 메종<br>
		<i class="bi bi-phone"></i> 02-4944-3930<br>
		<i class="bi bi-building"></i> 서울시 강남구 134 메종<br>
		<i class="bi bi-envelope"></i> mezong@gmail.com<br>
		<i class="bi bi-instagram"></i> @imklolz
	</div>
</body>
</html>