<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btncheck").click(function() {
			//id읽기
			var id = $("#id").val();
			$.ajax({
				type:"get",
				url:"idcheck",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					if(res.count==1){
						alert("이미 가입된 아이디 입니다.\n다시 입력해 주세요.");
						$("#id").val('');
					}else{
						alert("사용 가능합니다.");
					}
				}
			})
		})
	})
</script>
</head>
<body>
<div style="margin: 100px 100px;">
<form action="insertmember" method="post">
	<table class="table table-bordered" style="width: 500px">
		<caption align="top"><b>회원가입</b></caption>
		<tr>
			<th align="center" valign="middle">이름</th>
			<td>
				<input type="text" name="name" style="width: 120px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">아이디</th>
			<td>
				<div class="d-inline-flex">
					<input type="text" name="id" style="width: 150px;" required="required" class="form-control" id="id">&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-danger" id="btncheck">중복확인</button>
				</div>
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">비밀번호</th>
			<td>
				<input type="text" name="pass" style="width: 200px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">전화번호</th>
			<td>
				<input type="text" name="hp" style="width: 200px;" required="required" class="form-control">
			</td>
		</tr>			
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success" >회원가입</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">회원목록</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>