<%@page import="simpleboard.data.SimpleBoardDao"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
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
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pass = request.getParameter("pass");
	String num = request.getParameter("num");

	SimpleBoardDto dto = new SimpleBoardDto();

	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPass(pass);
	dto.setNum(num);

	SimpleBoardDao dao = new SimpleBoardDao();
	dao.simpleInsert(dto);

	//인서트후 내용보기로 이동하려면 방금 인서트된 num값을 알아야함
	int num1 = dao.getMaxNum();
	response.sendRedirect("contentView.jsp?num="+num1);
	%>
</body>
</html>