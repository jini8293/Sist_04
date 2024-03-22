<%@page import="data.dao.MemberDao"%>
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
//프로젝트 경로
String root = request.getContextPath();
%>
<body>

	<div class="d-inline-flex">
	<a href="<%=root%>" style="color: black; text-decoration: none; "><img
		src="<%=root%>/image/unmbbo.png" width="130" style="margin-top: 18px; margin-left: 90px;"></a>
	</div>
	<div style="float: right; padding-right: 50px;">
		<%
		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");

		MemberDao dao = new MemberDao();
		String name = dao.getName(myid);

		if (loginok == null) {
		%>
		<button type="button"
			onclick="location.href='index.jsp?main=login/loginForm.jsp'" style="margin-top: 35px;"
			class="btn btn-outline-danger">로그인</button>
		<%
		}else{
			%>
			<div  class="d-inline-flex" style="margin-top: 45px;">
			<b style="font-size: 10pt;"><%=name %></b><p style="font-size: 10pt;">님 환영합니다</p>
			</div>
			<button type="button"
			onclick="location.href='login/logoutAction.jsp'" style="margin-top: 8px;" 
			class="btn btn-outline-danger">로그아웃</button>
			
			<%
		}
		%>

	</div>
</body>
</html>