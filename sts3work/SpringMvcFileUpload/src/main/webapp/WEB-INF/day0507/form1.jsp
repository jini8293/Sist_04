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
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th class="table-light">이름</th>
				<td>
					<input type="text" name="irum" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">성별</th>
				<td>
					<input type="radio" name="gender" value="남자" checked="checked">남자
					<input type="radio" name="gender" value="여자">여자
				</td>
			</tr>
			<tr>
				<th class="table-light">거주지</th>
				<td>
					<select name="addr" class="form-control">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
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