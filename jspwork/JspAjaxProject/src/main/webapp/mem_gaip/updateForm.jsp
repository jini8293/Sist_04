<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
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
<style type="text/css">
.div1{
	font-family: IBM Plex Sans KR;
}


</style>
</head>
<%
String m_num = request.getParameter("m_num");
MemgaipDao dao = new MemgaipDao();
MemgaipDto dto = dao.getData(m_num);
%>
<body>
<div style="margin: 50px 100px; width: 500px;" class="div1">
	<form action="updateAction.jsp" method="post" enctype="multipart/form-data" name="mfrm">
	 <input type="hidden" name="m_num" value="<%=m_num%>">
		<table class="table table-bordered">
			<caption align="top"><b>내 정보 수정</b></caption>
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">아이디</td>
				<td>
					<div class="d-inline-flex">
					<h5 style="text-align: center; font-weight:bold; margin-top: 5px; margin-left: 5px; font-size: 13pt;" valign="middle"><%=dto.getM_id()%></h5>
					</div>
				</td>
			</tr>
			
			<tr>
				<td width="150" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">비밀번호</td>
				<td>
					<h5  style="font-weight:bold; margin-top: 5px; margin-left: 5px; font-size: 12pt; color: red;">변경 불가</h5>
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">회원명</td>
				<td>
					<input type="text" class="form-control"
					style="width: 120px;" name="m_name" value="<%=dto.getM_name()%>">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">사진</td>
				<td>
					<input type="file" class="form-control"
					style="width: 250px;" name="m_photo" value="<%=dto.getM_photo()%>">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">H P</td>
				<td>
					<input type="text" class="form-control"
					style="width: 250px;" name="m_hp" value="<%=dto.getM_hp()%>">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-warning" id="btnsubmit">회원수정</button>
					<button type="button" class="btn btn-outline-dark" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>