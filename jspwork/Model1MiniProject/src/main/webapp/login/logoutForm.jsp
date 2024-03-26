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
<body>
	<%
	String root = request.getContextPath();
	String id = (String) session.getAttribute("myid");

	MemberDao dao = new MemberDao();
	String name = dao.getName(id);
	%>
	<div style="margin: 100px 430px;">
		<img src="image/bban2.jpeg" width="200" style="margin-bottom: 20px; border-radius: 200px; margin-left: 20px;">
		<h4 style=" margin-left: 22px;"><%=name%>님이 로그인중
		</h4>
		<button class="btn btn-outline-danger" 
			onclick="location.href='login/logoutAction.jsp'">로그아웃</button>
		<button class="btn btn-outline-warning"
			onclick="location.href='<%=root%>/index.jsp?main=member/myPage.jsp'">my page</button>	
		<button class="btn btn-outline-dark"
			onclick="location.href='<%=root%>/'">home</button>
	</div>

</body>
</html>