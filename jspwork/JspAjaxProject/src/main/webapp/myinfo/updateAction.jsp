<%@page import="myinfo.db.MyInfoDto"%>
<%@page import="java.sql.Date"%>
<%@page import="myinfo.db.MyInfoDao"%>
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

	MyInfoDao dao = new MyInfoDao();

	String name = request.getParameter("name");
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String blood = request.getParameter("blood");
	String birthString = request.getParameter("birth");
	String num = request.getParameter("num");
	
    Date birth = Date.valueOf(birthString);

	MyInfoDto dto = new MyInfoDto();
	dto.setName(name);
	dto.setHp(hp);
	dto.setBlood(blood);
	dto.setBirth(birth);
	dto.setNum(num);

	dao.myinfoUpdate(dto);
	
	response.sendRedirect("infoList.jsp");
	%>
</body>
</html>