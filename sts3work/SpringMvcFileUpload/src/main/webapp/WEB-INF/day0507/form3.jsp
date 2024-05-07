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
	<form action="read3" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th class="table-light">상품명</th>
				<td>
					<input type="text" name="sang" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">색상</th>
				<td>
					<input type="color" name="color" class="form-control" value="#ffccff" style="width: 50px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">가격</th>
				<td>
					<input type="text" name="price" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">이미지</th>
				<td>
					<select name="image" class="form-control">
						<option value="01">사진1</option>
						<option value="03">사진2</option>
						<option value="04">사진3</option>
						<option value="05">사진4</option>
						<option value="06">사진5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">데이터 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>