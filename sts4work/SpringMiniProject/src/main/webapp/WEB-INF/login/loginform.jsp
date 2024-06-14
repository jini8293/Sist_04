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
<div style="margin: 100px 350px;" class="loginform">
	<form action="loginprocess" method="post">
		<table class="table table-bordered" style="width: 400px;">
			
			<tr>
			<td rowspan="4" width="200" align="center" valign="middle">
			로그인
			</td>
				<td>
					<input type="text" name="id" class="form-control"
					required="required" placeholder="id" style="width: 200px;"
					value="${sessionScope.saveok==null?"":sessionScope.myid }">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass" id="pass" class="form-control"
					required="required" placeholder="passward" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox"  name="cbsave"
					${sessionScope.saveok==null?"":"checked" }>&nbsp;아이디 저장
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-success btn-lg"
					style="width: 200px;">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>