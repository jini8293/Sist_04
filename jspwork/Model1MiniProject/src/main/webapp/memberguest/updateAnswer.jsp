<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
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
   request.setCharacterEncoding("utf-8");
   
   //데이터 읽기
   String idx=request.getParameter("idx");
   String ucontent=request.getParameter("ucontent");

   
   AnswerGuestDto dto=new AnswerGuestDto();
   dto.setIdx(idx);
   dto.setContent(ucontent);

   
   AnswerGuestDao dao=new AnswerGuestDao();
   dao.updateAnswer(dto);
%>
</body>
</html>