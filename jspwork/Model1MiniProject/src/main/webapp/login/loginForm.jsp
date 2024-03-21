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
<title>Insert title here</title>
</head>
<% 

//세션값 얻기
String saveok = (String) session.getAttribute("saveok");
String myid = "";
if(saveok!=null){
	myid=(String) session.getAttribute("myid");
}

%>
<body>
<div style="margin: 50px 50px;">
	<form action="login/loginAction.jsp" method="post">
		<table class="table table-bordered" style="width: 300px;">
			
			<tr>
			<td rowspan="4" width="300">
			로그인
			</td>
				<td>
					<input type="text" name="id" class="form-control"
					required="required" placeholder="id" style="width: 200px;"
					value="<%=myid%>">
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
					<%=saveok==null?"":"checked" %>>&nbsp;아이디 저장
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