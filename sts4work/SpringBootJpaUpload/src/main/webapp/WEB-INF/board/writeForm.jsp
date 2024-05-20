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
<div style="margin: 100px 100px; width: 500px;">
	<form action="add" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top"><B>글쓰기</B></caption>		
			<tr>
				<th class="table-warning" width="120" valign="middle" style="text-align: center;">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 130px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th class="table-warning" width="120" valign="middle" style="text-align: center;">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					style="width: 300px;" required="required"> 
				</td>
			</tr>
			<tr>
				<th class="table-warning" width="120" valign="middle" style="text-align: center;">사진</th>
				<td>
					<input type="file" name="upload" class="form-control"
					style="width: 200px;"> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 150px;"
					name="content" required="required"></textarea>
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