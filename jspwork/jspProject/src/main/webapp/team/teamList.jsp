<%@page import="java.util.ArrayList"%>
<%@page import="team.model.TeamDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="team.model.TeamDao"%>
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
<%
TeamDao dao = new TeamDao();
ArrayList<TeamDto> team = dao.listTeam();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<body>

	<div style="margin: 50px 50px">
		<table class="table table-bordered">
			<caption align="top">
				<b>[ TEAM 리스트 ●'◡'● ]</b>
			</caption>
			<tr>

				<th style="font-family: IBM Plex Sans KR;" class="table-dark">No.</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark">NAME</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark">DRIVER</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark">ADDR</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark">JOIN
					DAY</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark">EDIT</th>

			</tr>
			<%
			for (int i = 0; i < team.size(); i++) {
				TeamDto dto = team.get(i);
				
			%>

			<tr>
				<td align="center"><%=i+1%></td>
				<td align="center"><%=dto.getName()%></td>
				<td align="center"><%=dto.getDriver()%></td>
				<td align="center"><%=dto.getAddr()%></td>
				<td align="center"><%=sdf.format(dto.getWriteday())%></td>
				<td><button type="button" class="btn btn-success btn-sm"
						onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
				</td>
			</tr>
			<%
			}
			%>

		</table>
		<button type="button" class="btn btn-dark"
			onclick="location.href='addForm.jsp'">추가</button>

	</div>
</body>
</html>