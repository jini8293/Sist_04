<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div style="margin: 30px 50px;">
	<button type="button" class="btn btn-info"
		onclick="location.href='writeform'">자동차 정보입력</button>
	<c:if test="${totalcount==0 }">
		<h3 class="alert alert-info">저장된 차의 정보가 없습니다</h3>
	</c:if>
	<c:if test="${totalcount>0 }">
		<h3 class="alert alert-info">총 ${totalcount }개의 자동차가 있습니다</h3>
		<table class="table table-bordered" style="width: 800px;">
			<tr class="table-success">
				<th width="80">번호</th>
				<th width="280">자동차명</th>
				<th width="120">차량색상</th>
				<th width="120">차량가격</th>
				<th width="180" >구입일</th>
				<th width="200" >편집</th>
			</tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center" valign="middle">${i.count }</td>
					<td valign="middle"><b>${dto.carname }</b></td>
					<td align="center" valign="middle">
						<div style="width: 20px; height: 20px; background-color: ${dto.carcolor }; border: 1px solid lightgray;"></div>
					</td>
					<td align="center" valign="middle"><fmt:formatNumber value="${dto.carprice }"
							type="currency" /></td>
					<td align="center" valign="middle">${dto.carguip }</td>
					<td align="center">
						<button class="btn btn-outline-info btn-sm" type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button class="btn btn-danger btn-sm" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>