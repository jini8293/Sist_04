<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
div.div1{
	font-family:IBM Plex Sans KR; 
	font-size: 12pt;
	text-align: center;
}

a:link,a:visited{
	text-decoration: none;
	color: black;
}

a:hover{
	text-decoration:underline;
	color: gray;
}
</style>
<script type="text/javascript">
function funcdel(num) {
	var yes = confirm("정말 삭제하시겠습니까?");
	if(yes){
		location.href='member/memberDelete.jsp?num='+num;
	}
}
</script>
</head>
<%
	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 30px 50px; width: 1000px;" class="div1">
	<h5>총 <b style="color: red;"><%=list.size() %></b>명의 회원이 있습니다</h5>
		<table class="table table-bordered">
			<caption align="top"><b>전체 회원 명단</b></caption>
			<tr align="center" class="table-dark">
				<th width="80">번호</th>
				<th width="120">이름</th>
				<th width="120">아이디</th>
				<th width="200">전화번호</th>
				<th width="250">주소</th>
				<th width="220">이메일</th>
				<th width="180">가입일</th>
				<th width="80">ps</th>
			</tr>
			
			<%
				int no=1;
				for(MemberDto dto:list){
					
			%>
			
			<tr>
				<td align="center" valign="middle"><%=no++%></td>
				<td align="center" valign="middle"><b><%=dto.getName() %></b></td>
				<td align="center" valign="middle"><%=dto.getId() %></td>
				<td align="center" valign="middle"><%=dto.getHp() %></td>
				<td align="center" valign="middle"><%=dto.getAddr() %></td>
				<td align="center" valign="middle"><%=dto.getEmail() %></td>
				<td align="center" valign="middle"><%=sdf.format(dto.getGaipday())%></td>
				<td align="center" valign="middle">
					<button type="button" class="btn btn-danger btn-sm"
					onclick="funcdel(<%=dto.getNum()%>)">강퇴</button>
				</td>
			</tr>
			<%
			}
			%>
			
		</table>
	
	</div>

</body>
</html>