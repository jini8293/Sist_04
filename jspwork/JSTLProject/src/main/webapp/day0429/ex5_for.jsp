<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>forEach문 , forTokens문</h2>

<!-- [1] [2] [3] -->
<c:forEach var="a" begin="1" end="10">
	[${a }]&nbsp;
</c:forEach>

<c:forEach var="a" begin="1" end="10" step="2">
	[${a }]&nbsp;
</c:forEach>
<br>

<%
	String [] mycolors={"red","yellow","gray","green","cyan","orange","magenta"};
%>
set

</body>
</html>