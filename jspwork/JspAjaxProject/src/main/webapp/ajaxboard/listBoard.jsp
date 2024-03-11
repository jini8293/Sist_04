<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();

	List<AjaxBoardDto> list = dao.getData();
	
	JSONArray arr = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(AjaxBoardDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("writer",dto.getWriter());
		ob.put("subject",dto.getSubject());
		ob.put("avata",dto.getAvata());
		ob.put("content",dto.getContent());
		ob.put("writeday",sdf.format(dto.getWriteday()));
		
		arr.add(ob);
		
	}
	
%>
<%=arr.toString()%>