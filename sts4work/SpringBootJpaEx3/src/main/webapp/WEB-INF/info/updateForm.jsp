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
<div style="margin: 100px 100px; width: 500px;">
	<form action="update" method="post">
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered">
			<caption align="top"><b>학생정보</b></caption>
			<tr>
				<th>학생명</th>
				<td>
					<input type="text" name="stuname" class="form-control"
					style="width: 180px;" required="required" value="${dto.stuname }"> 
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="text" name="stuhp" class="form-control"
					style="width: 150px;" required="required" value="${dto.stuhp }"> 
				</td>
			</tr>
			<tr>
				<th>학생주소</th>
				<td>
					<input type="text" name="stuaddr" class="form-control"
					style="width: 200px;" required="required" value="${dto.stuaddr }"> 
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<select name="stuphoto">
						<option value="1.jpg" selected="1.jpg=${dto.stuphoto }?"":selected">이미지1</option>
						<option value="2.jpg" selected="2.jpg=${dto.stuphoto }?"":selected">이미지2</option>
						<option value="3.jpg" selected="3.jpg=${dto.stuphoto }?"":selected">이미지3</option>
						<option value="4.jpg" selected="4.jpg=${dto.stuphoto }?"":selected">이미지4</option>
						<option value="5.jpg" selected="5.jpg=${dto.stuphoto }?"":selected">이미지5</option>
						<option value="6.jpg" selected="6.jpg=${dto.stuphoto }?"":selected">이미지6</option>
						<option value="7.jpg" selected="7.jpg=${dto.stuphoto }?"":selected">이미지7</option>
						<option value="8.jpg" selected="8.jpg=${dto.stuphoto }?"":selected">이미지8</option>
						<option value="9.jpg" selected="9.jpg=${dto.stuphoto }?"":selected">이미지9</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-outline-info" value="수정">
					<input type="button" class="btn btn-outline-warning" value="목록" onclick="location.href='list'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>