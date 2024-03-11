<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   AjaxBoardDao dao=new AjaxBoardDao();

   //num읽기
   String num=request.getParameter("num");
   //num에 해당 dto얻기
   AjaxBoardDto dto=dao.dataGet(num);
   
   //날짜 타입 문자열 지정
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   
   //dto를 json으로 변환
   JSONObject ob=new JSONObject();
   
   //json에 데이터 추가
   ob.put("num", dto.getNum());
   ob.put("writer", dto.getWriter());
   ob.put("subject", dto.getSubject());
   ob.put("avata", dto.getAvata());
   ob.put("content", dto.getContent());
   ob.put("writeday",sdf.format(dto.getWriteday()));
%>

<%=ob.toString()%>