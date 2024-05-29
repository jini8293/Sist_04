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
		font-family:IBM Plex Sans KR; 
	}
</style>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered">
			<caption align="top"><b>상품 정보 입력하기</b></caption>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">NAME</th>
				<td>
					<input type="text" name="sangpum" class="form-control"
					style="width: 180px;" required="required" value="${dto.sangpum }"> 
				</td>
			</tr>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">PRICE</th>
				<td>
					<input type="text" name="price" class="form-control"
					style="width: 150px;" required="required" value="${dto.price }"> 
				</td>
			</tr>
			<tr>
				<th width="120" class="table-light" style="text-align: center;" valign="middle">IMAGE</th>
				<td>
					<b style="color: red;">※수정할 경우에만 선택해주세요</b>
					<input type="file" name="upload" class="form-control"
					style="width: 300px;"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-outline-info" value="저장">
					<input type="button" class="btn btn-outline-warning" value="목록" onclick="location.href='list'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>