<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<form action="read" method="post">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th width="200">이름</th>
				<td>
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
			<tr>
				<th>좋아하는 색</th>
				<td>
					<input type="color" name="color" class="form-control" value="#ffccff" style="width: 50px;">
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<div class="form-check">
						<input type="checkbox" name="hobby" value="영화감상" class="form-check-input">영화감상
					</div>
					<div class="form-check">
						<input type="checkbox" name="hobby" value="게임" class="form-check-input">게임
					</div>
					<div class="form-check">
						<input type="checkbox" name="hobby" value="여행" class="form-check-input">여행
					</div>
					<div class="form-check">
						<input type="checkbox" name="hobby" value="코딩" class="form-check-input">코딩
					</div>
					<div class="form-check">
						<input type="checkbox" name="hobby" value="낚시" class="form-check-input">낚시
					</div>
				</td>
			</tr>
			<tr>
				<th>가장 좋아하는 언어</th>
				<td>
					<select name="lang">
						<option value="Java">Java</option>
						<option value="Html">Html</option>
						<option value="Ajax">Ajax</option>
						<option value="Spring">Spring</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" >서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>