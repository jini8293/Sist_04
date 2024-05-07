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
	<div class="alert alert-info">
		이름: ${dto.name }<br>
		좋아하는 색: ${dto.color }
		<div style="width: 30px; height: 30px; background: ${dto.color}"></div><br>
		취미:
		<c:if test="${empty dto.hobby }">취미없음</c:if>
		<c:if test="${not empty dto.hobby }">
			<c:forEach items="${dto.hobby }" var="h">
				[${h }]
			</c:forEach>
		</c:if>
		<br>
		가장재밌는 언어:${dto.lang }
	</div>
</body>
</html>