<%@page import="simpleboardanswer.model.SimpleAnswerDto"%>
<%@page import="simpleboardanswer.model.SimpleAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="dao" class="simpleboardanswer.model.SimpleAnswerDao"/>
    <jsp:useBean id="dto" class="simpleboardanswer.model.SimpleAnswerDto"/>
    <jsp:setProperty property="*" name="dto"/>
<%
	request.setCharacterEncoding("utf-8");
	dao.answerUpdate(dto);
	
%>
    