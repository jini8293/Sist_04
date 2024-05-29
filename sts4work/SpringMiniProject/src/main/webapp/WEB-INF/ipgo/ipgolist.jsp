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
</head>
<body>		
	<div style="margin: 100px 100px;">
		<div class="alert alert-danger">
			<b>${totalCount }개의 상품이 있습니다</b>
		</div>
		<table class="table table-bordered" style="width: 600px;">
			<caption align="top"><b>
				<button type="button" class="btn btn-outline-danger"
				onclick="location.href='writeform'">상품추가</button>
			</b></caption>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td width="200" rowspan="4">
						<c:if test="${dto.photoname!='no' }">
							<a>
								<img alt="" src="../ipgoimage/${dto.photoname }" width="150">
							</a>
						</c:if>
						<c:if test="${dto.photoname=='no' }">
							<a>
								<img alt="" src="../ipgoimage/noimage.png" width="150">
							</a>
						</c:if>
					</td>
					<td>
						<b>${dto.sangpum }</b>
					</td>
				</tr>
				<tr>
					<td>
						<b><fmt:formatNumber value="${dto.price }" type="currency"/> </b>
					</td>
				</tr>
				<tr>
					<td>
						<b><fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/> </b>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-outline-success btn-sm"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>