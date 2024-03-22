<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

	div td{
		font-size: 12pt;
	}

</style>
<script type="text/javascript">
function funcdel(num) {
	//alert(num);
	$("#delnum").val(num);
	$("#myModal").modal('show');
	
	$(".btndel").click(function() {
		var num = $("#delnum").val();
		var pass = $("#delpass").val();
		location.href='member/deletemyPage.jsp?num='+num+"&pass="+pass;
		$("#delpass").val("");
	})
}
</script>
</head>
<%

	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String myid = (String) session.getAttribute("myid");
	String loginok = (String) session.getAttribute("loginok");
%>
<body>
	<div style="margin: 30px 50px; width: 800px;" class="div1">
		
		<%
		for(MemberDto dto:list){
			if(loginok!=null && myid.equals(dto.getId())){
		
		%>
		<table class="table table-bordered" >
			<tr>
				<td width="350" rowspan="7" valign="middle">
					<img src="image/bban2.jpeg" id="mainimg" width="350" style="border-radius: 200px;">
				</td>
				<td valign="middle">
					NAME | <%=dto.getName() %>
				</td>
				<td rowspan="7" style="width: 150px;" align="center" valign="middle">
					<button class="btn btn-outline-dark" type="button" onclick="location.href='index.jsp?main=member/updatepassForm.jsp?num=<%=dto.getNum()%>'">수정</button><br><br>
					<button class="btn btn-outline-danger" type="button" onclick="funcdel(<%=dto.getNum()%>)">탈퇴</button>
				</td>
			</tr>
			<tr>
				<td valign="middle" >
					ID | <%=dto.getId() %>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					PASS | <%=dto.getPass() %>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					H.P | <%=dto.getHp() %>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					ADDR | <%=dto.getAddr() %>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					EMAIL | <%=dto.getEmail() %>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					SINGED DAY | <%=sdf.format(dto.getGaipday()) %>
				</td>
			</tr>
			</table>
		<br>
			<%
			}
		}
	%>
		
	</div>
	<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content ">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="delnum">
      	<input type="hidden" id="delnum">
       <b>비밀번호를 입력해 주세요</b>
       <input type="password" id="delpass" class="form-control" style="width: 120px;" placeholder="passward">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">삭제</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>