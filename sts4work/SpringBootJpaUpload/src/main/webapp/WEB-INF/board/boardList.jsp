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
</style>
</head>
<body>
<div style="margin: 100px 100px; width: 1200px;">
		<button type="submit" class="btn btn-outline-danger" onclick="location.href='addform'">글쓰기</button>
		<br><br>
		<h3 class="alert alert-danger">
			<b>총 ${totalCount }개의 글이 있습니다.</b>	
		</h3>
		<table class="table table-bordered">
			<tr class="table-danger">
				<th width="80" style="text-align: center;">번호</th>
				<th width="280" style="text-align: center;">제목</th>
				<th width="180" style="text-align: center;">작성자</th>
				<th width="280" style="text-align: center;">작성일</th>
				<th width="180" style="text-align: center;">편집</th>				
			</tr>
			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center">
						<b>작성된 글이 없습니다.</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${totalCount>0 }">
			<c:forEach var="dto" items="${list }" varStatus="i">
				<c:set var="n" value="${totalCount-i.index }"/>
				<tr>					
					<td align="center" valign="middle">${n }</td>
					<td align="center" valign="middle">
						<a href="detail?num=${dto.num }" style="text-decoration: none; color: black;">${dto.subject }
							<c:if test="${dto.photo!='no'}">
								<i class="bi bi-image-fill"></i>
							</c:if>
						</a>
					</td>
					<td align="center" valign="middle">${dto.writer }</td>
					<td align="center" valign="middle">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" />
					</td>
					<td align="center" valign="middle">
						<button type="button" onclick="location.href='updateform?num=${dto.num}'"
						class="btn btn-outline-info btn-sm">수정</button>
						<button type="button" onclick="location.href='delete?num=${dto.num}'"
						class="btn btn-outline-danger btn-sm">삭제</button>
					</td>				
				</tr>
			</c:forEach>
			</c:if>
		</table>
</div>
</body>
</html>