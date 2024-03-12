<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
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

	QuizShopDao dao = new QuizShopDao();

	String sang_name = request.getParameter("sang_name");
    int price = Integer.parseInt(request.getParameter("price"));
	String photo = request.getParameter("photo");
	String ipgoday = request.getParameter("ipgoday");
	
	QuizShopDto dto = new QuizShopDto();
	dto.setSang_name(sang_name);
	dto.setPrice(price);
	dto.setPhoto(photo);
	dto.setIpgoday(ipgoday);

	dao.quizInsert(dto);
	
	response.sendRedirect("shopList.jsp");
	%>

</body>
</html>