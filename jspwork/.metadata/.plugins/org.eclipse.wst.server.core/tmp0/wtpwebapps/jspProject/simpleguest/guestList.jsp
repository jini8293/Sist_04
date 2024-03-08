<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleguest.model.GuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="simpleguest.model.GuestDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
span.day {
	float: right;
	color: #bbb;
}

div.edit {
	float: right;
}

i.bi {
	cursor: pointer;
}
</style>
</head>
<%
GuestDao dao = new GuestDao();
ArrayList<GuestDto> list = dao.getAllDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>

	<div style="margin: 50px 100px; width: 600px;">

		<button type="button" class="btn btn-dark"
			onclick="location.href='insertForm.jsp'" style="width: 100px;">추가</button>
		<br> <br>
		<%
		for (int i = 0; i < list.size(); i++) {
			GuestDto dto = list.get(i);
			int no = list.size() - i;
		%>
		<div class="edit">
			<i class='bi bi-x-circle btn btn-outline-danger' onclick="location.href='deleteAction.jsp?num=<%=dto.getNum()%>'"></i> 
			<i class="bi bi-pencil-square btn btn-outline-success" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'"></i>
		</div>
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<td><b>No.<%=no%></b>&nbsp;&nbsp; <b><%=dto.getNickname()%></b>&nbsp;&nbsp;
					<span class="day"><%=sdf.format(dto.getWriteday())%></span></td>
			</tr>
			<tr>
				<td>
					<div style="width: 400px;">
						<img src="../image/avata/b<%=dto.getImage()%>.png" style="width: 100px;" align="left"
							hspace="10">
						<pre><%=dto.getContent()%></pre>
					</div>
				</td>
			</tr>
		</table>

		<%
		}
		%>

	</div>
</body>
</html>