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
	div{
		font-family: IBM Plex Sans KR;
	}
	
	img{
		width: 50px;
		height: 70px;
	}
</style>
</head>
<body>
<div style="margin: 100px 100px; width: 1200px;">
		<button type="submit" class="btn btn-outline-info" onclick="location.href='writeform'">학생정보입력</button>
		<br><br>
		<h3 class="alert alert-info">
			<b>총 ${totalCount }명의 학생정보가 있습니다.</b>	
		</h3>
		
		<table class="table table-bordered">
			<tr class="table-info">
				<th width="80" style="text-align: center;">번호</th>
				<th width="180" style="text-align: center;">학색명</th>
				<th width="280" style="text-align: center;">전화번호</th>
				<th width="280" style="text-align: center;">주소</th>
				<th width="180" style="text-align: center;">사진</th>
				<th width="180" style="text-align: center;">편집</th>				
			</tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center" valign="middle">${i.count }</td>
					<td align="center" valign="middle">${dto.stuname }</td>
					<td align="center" valign="middle">${dto.stuhp }</td>
					<td align="center" valign="middle">${dto.stuaddr }</td>
					<td align="center" valign="middle"><img src="../${dto.stuphoto}"></td>
					<td align="center" valign="middle">
						<button type="button" onclick="location.href='updateform?num=${dto.num}'"
						class="btn btn-outline-info btn-sm">수정</button>
						<button type="button" onclick="location.href='delete?num=${dto.num}'"
						class="btn btn-outline-danger btn-sm">삭제</button>
					</td>				
				</tr>
			</c:forEach>
		</table>
</div>
</body>
</html>