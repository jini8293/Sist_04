<%@page import="data.dao.SmartDao"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
<%
//nums 얻기
String nums = request.getParameter("nums");

//,로 분리해서 배열선언
String [] num = nums.split(",");

//배열의 갯수만큼 delete
SmartDao dao = new SmartDao();
for(String n:num){
	dao.deleteSmart(n);
}

//목록으로 이동
response.sendRedirect("../index.jsp?main=smartboard/boardlist.jsp");
%>
</body>
</html>