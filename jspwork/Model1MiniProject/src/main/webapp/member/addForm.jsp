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
		
		//아이디 중복체크
		$("#btnIdCheck").click(function() {
			
			//id읽기
			var id = $("#id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				url:"member/idCheck.jsp",
				dataType:"json",
				data:{
					"id":id
				},
				success:function(res){
					
					//alert(res.count);
					if(res.count==1){
						alert("이미 존재하는 아이디입니다.");
						$("#id").val("");
						$("span.idsuccess").text("");
					}else{
						alert("사용 가능한 아이디입니다.");
						$("span.idsuccess").text("사용가능");
						
					}
				}
			})
			
		});
		
		$("#selemail").change(function () {
			$("#email2").val($(this).val());
		});
	});
	
	function check(f) {
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			//초기화
			f.pass.value="";
			f.pass2.value="";
			return false; //action 호출X
		}
	}
</script>
</head>
<body>
<div style="margin: 30px 100px; width: 500px;">
	<form action="member/addAction.jsp"  method="post" onsubmit="return check(this)">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th width="100" class="table-dark" valign="middle">아이디</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="id" id="id" maxlength="8" class="form-control"
					required="required" style="width:120px;">
					<button type="button" class="btn btn-outline-danger" id="btnIdCheck"
					style="margin-left: 10px;">중복체크</button>
					<span class="idsuccess" style="margin-left: 10px; font-size: 10pt; 
					margin-top: 10px; color: green;"></span>
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">비밀번호</th>
				<td>
				<div class="d-inline-flex">
					<input type="password" name="pass" id="pass" maxlength="18" class="form-control"
					required="required" style="width:140px;" placeholder="password">
					<input type="password" name="pass2" id="pass2" maxlength="18" class="form-control"
					required="required" style="width:140px; margin-left: 10px;" placeholder="recheck">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">이름</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="name" id="name" maxlength="7" class="form-control"
					required="required" style="width:120px;">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">핸드폰</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="hp" id="hp" class="form-control"
					required="required" style="width:180px;">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">주소</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="addr" id="addr" class="form-control"
					required="required" style="width:250px;">
				</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">이메일</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="email1" class="form-control"
					required="required" style="width:120px;">
					<b style="margin-left: 10px; margin-top: 3px;">@</b>
					<input type="text" name="email2" id="email2" class="form-control"
					required="required" style="width:120px; margin-left: 10px; ">
					<select id="selemail" class="form-control" style="font-size: 10pt; margin-left: 10px;">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">가입하기</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='index.jsp?main=member/addForm.jsp'">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>