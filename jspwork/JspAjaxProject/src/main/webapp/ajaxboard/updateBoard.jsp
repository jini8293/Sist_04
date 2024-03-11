<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
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
   
   //데이터 읽기
   String uwriter=request.getParameter("uwriter");
   String usubject=request.getParameter("usubject");
   String uavata=request.getParameter("uavata");
   String ucontent=request.getParameter("ucontent");
   String unum=request.getParameter("unum");
   
   AjaxBoardDto dto=new AjaxBoardDto();
   dto.setWriter(uwriter);
   dto.setSubject(usubject);
   dto.setAvata(uavata);
   dto.setContent(ucontent);
   dto.setNum(unum);
   
   AjaxBoardDao dao=new AjaxBoardDao();
   dao.boardUpdate(dto);
%>

</body>
</html>