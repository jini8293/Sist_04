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

	<img src="<%=root%>/image/bner.jpeg" width="1000" style=" border: 1px solid lightgray; border-radius: 20px;"><br><!-- 배너 -->
	<h3 style="padding-bottom: 40px; padding-top: 50px;">주요 캐릭터 보기</h3>
	<img src="<%=root%>/image/bban2.jpeg" width="245">
	<img src="<%=root%>/image/unmbbo.jpeg" width="245">
	<img src="<%=root%>/image/chunsik.jpeg" width="245">
	<img src="<%=root%>/image/hobbag.jpeg" width="245">
	
</body>
</html>