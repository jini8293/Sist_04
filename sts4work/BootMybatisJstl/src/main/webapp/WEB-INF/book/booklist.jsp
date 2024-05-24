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
	div {
	font-family: IBM Plex Sans KR;
}
</style>
</head>
<body>

	<div style="margin:50px 100px;">
    <button type="button" class="btn btn-outline-danger" onclick="location.href='addform'">도서등록</button>
</div>

<c:if test="${totalCount==0}">
    <div class="alert alert-danger" style="margin: 5px 100px;">
        <b>저장된 정보가 없습니다</b>
    </div>
</c:if>

<c:if test="${totalCount>0}">
    <div class="alert alert-danger" style="margin: 5px 100px;">
        <b>총 ${totalCount}개의 도서정보가 있습니다.</b>
    </div>
    <div style="margin: 10px 100px; display: flex; flex-wrap: wrap;">
        <c:forEach var="dto" items="${list}" varStatus="i">
            <div style="width: 200px; margin-right: 20px; margin-bottom: 20px;">
                <c:if test="${dto.bookimage!='no'}">
                    <img src="../photo/${dto.bookimage}" style="width: 200px;">
                </c:if>
                <c:if test="${dto.bookimage=='no'}">
                    <img src="/photo/noimage.png" style="width: 200px;">
                </c:if>
                <div><b>${dto.bookname}</b></div>
                <div>저자: ${dto.writer}</div>
                <div>출판사: ${dto.bookcompany}</div>
                <div>가격: <fmt:formatNumber value="${dto.bookprice}" type="currency"/></div>
                <div>입고일: <fmt:formatDate value="${dto.ipgoday}" pattern="yyyy-MM-dd"/></div>
                <div style="float: right;">
                    <button type="button" onclick="location.href='updateform?num=${dto.num}'" class="btn btn-outline-info btn-sm">수정</button>
                    <button type="button" onclick="location.href='delete?num=${dto.num}'" class="btn btn-outline-danger btn-sm">삭제</button>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>
</body>
</html>