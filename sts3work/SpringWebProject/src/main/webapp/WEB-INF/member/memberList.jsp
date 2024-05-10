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
	<button type="button" class="btn btn-outline-danger"
		onclick="location.href='addform'">회원가입</button>
		<br><br>
	<c:if test="${totalcount==0 }">
		<h3 class="alert alert-danger">저장된 고객의 정보가 없습니다</h3>
	</c:if>
	<c:if test="${totalcount>0 }">
		<h3 class="alert alert-danger">총 ${totalcount }명의 고객이 있습니다</h3>
		<table class="table table-bordered" style="width: 800px;">
			<tr class="table-danger">
				<th width="80">번호</th>
				<th width="280">회원명</th>
				<th width="120">아이디</th>
				<th width="120">비밀번호</th>
				<th width="200" >전화번호</th>
				<th width="180" >가입일</th>
				<th width="200" >편집</th>
			</tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center" valign="middle">${dto.num }</td>
					<td valign="middle"><b>${dto.name }</b></td>
					<td align="center" valign="middle">${dto.id }</td>
					<td align="center" valign="middle">${dto.pass }</td>
					<td align="center" valign="middle">${dto.hp }</td>
					<td align="center" valign="middle">${dto.gaipday }</td>
					<td align="center">
						<button class="btn btn-warning btn-sm" type="button" onclick="location.href='updateForm?num=${dto.num}'">수정</button>
						<button class="btn btn-outline-danger btn-sm" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>