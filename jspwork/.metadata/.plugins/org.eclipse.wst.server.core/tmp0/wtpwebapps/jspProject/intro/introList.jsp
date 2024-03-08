<%@page import="intro.model.IntroDto"%>
<%@page import="java.util.Vector"%>
<%@page import="intro.model.IntroDao"%>
<%@page import="java.util.ArrayList"%>
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
IntroDao dao = new IntroDao();
Vector<IntroDto> intro = dao.listIntro();
%>
<body>

	<div style="margin: 50px 50px">
		<table class="table table-bordered">
			<caption align="top">
				<h2>[ 자기소개 O(∩_∩)O ]</h2>
			</caption>
			<tr align="center">

				<th style="font-family: IBM Plex Sans KR;" class="table-dark" width="100">No.</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark" width="200">NAME</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark" width="100">AGE</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark" width="300">BIRTHDAY</th>
				<th style="font-family: IBM Plex Sans KR" class="table-dark" width="100">EDIT</th>

			</tr>
			
			<%if(intro.size()==0){ %>
				<tr>
					<td colspan="5" align="center">
						<h3 style="font-family: IBM Plex Sans KR;">자기소개가 없습니다</h3>
					</td>
				</tr>
					
			<%}else{
				
				for (int i = 0; i < intro.size(); i++) {
					IntroDto dto = intro.get(i);
			%>

			<tr>
				<td align="center"><%=i+1%></td>
				<td align="center"><%=dto.getName()%></td>
				<td align="center"><%=dto.getAge()%></td>
				<td align="center"><%=dto.getBirthday()%></td>
				<td align="center"><button type="button" class="btn btn-success btn-sm"
						onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">상세보기</button>
				</td>
			</tr>
			<%
			}
		}
	%>

		</table>
		<button type="button" class="btn btn-dark"
			onclick="location.href='addForm.jsp'">추가</button>

	</div>
</body>
</html>