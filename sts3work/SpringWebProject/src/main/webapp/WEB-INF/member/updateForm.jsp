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
<form action="updatemember" method="post">
<input type="hidden" name="num" value="${dto.num }">
	<table class="table table-bordered" style="width: 500px">
		<caption align="top"><b>회원정보 수정</b></caption>
				<tr>
			<th align="center" valign="middle">아이디</th>
			<td>
				&nbsp;<b>${dto.id }</b>
			</td>
		</tr>
		<tr>
			<th align="center" valign="middle">이름</th>
			<td>
				<input type="text" name="name" style="width: 120px;" required="required" class="form-control" value="${dto.name }">
			</td>
		</tr>
		<tr>
		<tr>
			<th align="center" valign="middle">전화번호</th>
			<td>
				<input type="text" name="hp" style="width: 200px;" required="required" class="form-control" value="${dto.hp }">
			</td>
		</tr>			
		<th align="center" valign="middle" style="color: red;">비밀번호 체크</th>
			<td>
				<input type="text" name="pass" style="width: 200px;" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success" >정보수정</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">돌아가기</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>