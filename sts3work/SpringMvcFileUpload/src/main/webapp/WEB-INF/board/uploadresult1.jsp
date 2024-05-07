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
	<div>
		<h2>제목: ${title }</h2>
		<c:if test="${fileName=='no' }">
			<b>업로드한 파일 없음</b>
		</c:if>
		<c:if test="${fileName!='no' }">
			<img alt="" src="../photo/${fileName }" style="max=width:200px;">
		</c:if>
		<h2>업로드한 이미지명: ${fileName }</h2>
		<h2>업로드할 실제경로: ${path }</h2>
	</div>
</body>
</html>