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
<script type="text/javascript">
	function openId() {
		window.open("idSearch.jsp","idcheck","left='100px', top='100px', width='100px', height='50px'");
	}
	
	$(function() {
		$("#btnsubmit").click(function(){
			if(mfrm.m_id.value.length==0){
				alert("아이디 입력버튼을 눌러주세요");
				return false; //form 액션 호출 안되게
			}
		})
	})
</script>

<body>
<div style="margin: 50px 100px; width: 500px;" class="div1">
	<form action="addMember.jsp" method="post" enctype="multipart/form-data" name="mfrm">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">아이디</td>
				<td>
					<div class="d-inline-flex">
					<input type="text" class="form-control" style="width: 120px;"
					 name="m_id" required="required" readonly="readonly">
					 <button type="button" class="btn btn-outline-danger btn-sm" style="margin-left: 8px;"
					 onclick="openId()">중복 체크</button>
					</div>
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">비밀번호</td>
				<td>
					<input type="password" class="form-control"
					style="width: 180px;" name="m_pass" required="required">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">회원명</td>
				<td>
					<input type="text" class="form-control"
					style="width: 120px;" name="m_name" required="required">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">사진</td>
				<td>
					<input type="file" class="form-control"
					style="width: 250px;" name="m_photo" required="required">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-dark" style="text-align: center; font-weight: bold;" valign="middle">H P</td>
				<td>
					<input type="text" class="form-control"
					style="width: 250px;" name="m_hp">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-dark" id="btnsubmit">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>