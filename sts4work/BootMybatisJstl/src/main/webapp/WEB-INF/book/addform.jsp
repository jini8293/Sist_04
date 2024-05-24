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
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top"><b>도서 정보 입력하기</b></caption>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">도서명</th>
				<td>
					<input type="text" name="bookname" class="form-control"
					style="width: 180px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">저자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 150px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">가격</th>
				<td>
					<input type="text" name="bookprice" class="form-control"
					style="width: 150px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th width="100" class="table-light" style="text-align: center;" valign="middle">출판사</th>
				<td>
					<input type="text" name="bookcompany" class="form-control"
					style="width: 150px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th width="120" class="table-light" style="text-align: center;" valign="middle">도서 이미지</th>
				<td>
					<input type="file" name="photo" class="form-control"
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