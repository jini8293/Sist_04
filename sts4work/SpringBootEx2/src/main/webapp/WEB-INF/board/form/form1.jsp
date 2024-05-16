<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div style="margin: 100px 500px;">
	<h1>폼데이터 각각 읽기</h1>
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th>학생명</th>
				<td>
					<input type="text" name="name" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th>자바 점수</th>
				<td>
					<input type="text" name="java" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th>스프링 점수</th>
				<td>
					<input type="text" name="spring" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>