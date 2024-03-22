<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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

th{
	font-size: 12pt;
	text-align: center;
}

</style>
<%

	//프로젝트 경로
	String root = request.getContextPath();

%>
<script type="text/javascript">
	$(function() {
		
		$("#selemail").change(function () {
			$("#email2").val($(this).val());
		});
	});
	
	
</script>
</head>
<%
String num = request.getParameter("num");
MemberDao dao = new MemberDao();
MemberDto dto = dao.getdataMember(num);
%>
<body>
<div style="margin: 30px 100px; width: 500px;">
	<form action="member/updateAction.jsp"  method="post" onsubmit="return check(this)">
	 <input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th width="100" class="table-dark" valign="middle">아이디</th>
				<td>
				<div class="d-inline-flex">
					<b style="font-size: 12pt;">&nbsp;&nbsp;<%=dto.getId() %></b>
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">이름</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="name" id="name" maxlength="7" class="form-control"
					required="required" style="width:120px;" value="<%=dto.getName()%>">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">핸드폰</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="hp" id="hp" class="form-control"
					required="required" style="width:180px;" value="<%=dto.getHp()%>">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">주소</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="addr" id="addr" class="form-control"
					required="required" style="width:250px;" value="<%=dto.getAddr()%>">
				</div>
				</td>
			</tr>
			
			<tr>
			<%
				StringTokenizer st = new StringTokenizer(dto.getEmail(),"@");
				String email1 = st.nextToken();
				String email2 = st.nextToken();
			%>
				<th width="100" class="table-dark" valign="middle">이메일</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="email1" class="form-control"
					required="required" style="width:120px;" value="<%=email1%>">
					<b style="margin-left: 10px; margin-top: 3px;">@</b>
					<input type="text" name="email2" id="email2" class="form-control"
					required="required" style="width:120px; margin-left: 10px; " value="<%=email2%>">
					<select id="selemail" class="form-control" style="font-size: 10pt; margin-left: 10px;">
						<option value="">직접입력</option>
						<option value="naver.com" <%=email2.equals("naver.com")?"selected":"" %>>naver.com</option>
						<option value="nate.com" <%=email2.equals("nate.com")?"selected":"" %>>nate.com</option>
						<option value="gmail.com" <%=email2.equals("gmail.com")?"selected":"" %>>gmail.com</option>
						<option value="daum.net" <%=email2.equals("daum.net")?"selected":"" %>>daum.net</option>
					</select>
				</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">수정하기</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='index.jsp?main=member/addForm.jsp'">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>