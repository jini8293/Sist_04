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
		onclick="location.href='writeform'">고객 정보입력</button>
		<button type="button" class="btn btn-outline-danger"
		onclick="location.href='../samsung/list'">차목록</button>
		<br><br>
	<c:if test="${totalcount==0 }">
		<h3 class="alert alert-info">저장된 고객의 정보가 없습니다</h3>
	</c:if>
	<c:if test="${totalcount>0 }">
		<h3 class="alert alert-danger" style="">총 ${totalcount }개의 고객이 있습니다</h3>
		<table class="table table-bordered" style="width: 900px;">
			<tr class="table-danger">
				<th width="80" style="text-align: center;">번호</th>
				<th width="280" style="text-align: center;">고객명</th>
				<th width="180" style="text-align: center;">전화번호</th>
				<th width="300" style="text-align: center;">주소</th>
				<th width="180" style="text-align: center;">가입일</th>
				<th width="200" style="text-align: center;" >편집</th>
			</tr>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td align="center" valign="middle">${dto.num }</td>
					<td align="center" valign="middle"><b>${dto.name }</b></td>
					<td align="center" valign="middle">${dto.hp }</td>
					<td align="center" valign="middle">${dto.addr }</td>
					<td align="center" valign="middle">${dto.guipday}</td>
					<td align="center">
						<button class="btn btn-outline-warning btn-sm" type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button class="btn btn-danger btn-sm" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>