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
<form action="insertcar" method="post">
	<table class="table table-bordered" style="width: 400px">
		<tr>
			<th align="center" valign="middle">자동차명</th>
			<td>
				<input type="text" name="carname" style="width: 120px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">차량가격</th>
			<td>
				<input type="text" name="carprice" style="width: 150px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">차량색상</th>
			<td>
				<input type="color" name="carcolor" style="width: 200px;" required="required" value="#ffffcc" class="form-control">
			</td>
		</tr>		
		<tr>
			<th align="center" valign="middle">구입일</th>
			<td>
				<input type="date" name="carguip" style="width: 200px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success">DB저장</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>