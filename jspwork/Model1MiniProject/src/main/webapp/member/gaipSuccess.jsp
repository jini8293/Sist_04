<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<title>Insert title here</title>
<body>
	<%
	String root = request.getContextPath();
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	String name = dao.getName(id);

	%>
	<div style="margin: 100px 400px;">
		<img src="image/success.png" width="200"
			style="margin-bottom: 30px;">
		<h4><%=name%>님,&nbsp;&nbsp;환영합니다!
		</h4>
		<button class="btn btn-outline-success" onclick="location.href='index.jsp?main=login/loginForm.jsp'">로그인</button>
		<button class="btn btn-outline-dark" onclick="location.href='<%=root %>/'">home</button>
	</div>
	
</body>
</html>
