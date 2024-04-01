<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");
%>
<jsp:useBean id="dao" class="data.dao.SmartAnswerDao" />
<jsp:useBean id="dto" class="data.dto.SmartAnswerDto" />

<jsp:setProperty property="*" name="dto" />
<%
dao.answerInsert(dto);
response.sendRedirect("../index.jsp?main=smartboard/contentview.jsp?num=" + num + "&currentPage=" + currentPage);
%>