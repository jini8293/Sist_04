<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
	String num = request.getParameter("num");
	String currentpage = request.getParameter("currentPage");

	GuestDao dao = new GuestDao();

		
		//게시글 지우기전 업로드된 이미지 지우기
		String photoname = dao.getData(num).getPhotoname();
		
		//업로드경로
		String uPath = getServletContext().getRealPath("/save");
		
		//파일생성
		File file = new File(uPath+"\\"+photoname);
		
		//파일 삭제
		if(file.exists()){ //파일이 존재하면
			file.delete(); //파일을 삭제
		}
		
		dao.deleteGuest(num); 
		
		response.sendRedirect("../index.jsp?main=memberguest/guestList.jsp?currentPage="+currentpage);
	%>


</body>
</html>