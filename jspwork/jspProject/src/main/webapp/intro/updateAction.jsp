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
	String hometown = request.getParameter("hometown");
	String[] hobby = request.getParameterValues("hobby");
	%>

	<jsp:useBean id="dao" class="intro.model.IntroDao" />
	<jsp:useBean id="dto" class="intro.model.IntroDto" />

	<jsp:setProperty property="*" name="dto" />

	<%
	dto.setHometown(hometown == null ? "선택안함" : dto.getHometown());

	String hl = "";
	if (hobby == null) {

		hl += "취미 없음";

	} else {

		for (int i = 0; i < hobby.length; i++) {
			hl += hobby[i];
			if (i < hobby.length - 1) {
			hl += ", ";
			}
		}

	}

	dto.setHobby(hl);

	dao.introUpdate(dto);
	response.sendRedirect("introList.jsp");
	%>
</body>
</html>