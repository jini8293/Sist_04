<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
    String fimage = request.getParameter("fimage");
	String fname = request.getParameter("fname");
	String l1 = request.getParameter("l1");
	String l2 = request.getParameter("l2");
	String l3 = request.getParameter("l3");
	
	int tot = Integer.parseInt(l1)+Integer.parseInt(l2)+Integer.parseInt(l3);
	int avg =  tot/3;
	
	JSONObject ob = new JSONObject();
	ob.put("fimage",fimage);
	ob.put("fname",fname);
	ob.put("tot",tot);
	ob.put("avg",avg);
	
	
  %>
  <%=ob.toString() %>
    