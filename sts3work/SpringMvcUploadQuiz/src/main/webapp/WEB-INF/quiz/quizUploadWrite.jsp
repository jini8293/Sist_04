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
  <h2>상품명: ${sang }</h2>
  <h2>상품 이미지</h2>
  <c:forEach var="i" items="${files }">
    <img alt="" src="../image/${i }" style="width: 200px; height: 200px;">
  </c:forEach>
  <h2>가격: <fmt:formatNumber value="${price }" type="currency"/></h2>
  <h2>입고일: ${date }</h2>
</body>
</html>