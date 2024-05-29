<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Insert title here</title>
<style type="text/css">
	#showimg{
		border-radius: 100px;
		width: 100px;
	}
</style>
<script type="text/javascript">

	$(function() {
		//버튼 클릭시 사진 불러오는 이벤트
		$("#btnphoto").click(function() {
			$("#myphoto").trigger("click");
		});

		//사진을 불러오면 미리보기하기
		$("#myphoto").change(function() {
			if ($(this)[0].files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#showimg").attr('src', e.target.result);
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}
		});

		//중복체크 버튼 클릭시 아이디 체크
		$("#btnIdCheck").click(function() {
			var id = $("#loginid").val();
			$.ajax({
				type : "get",
				url : "/member/idcheck",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(res) {
					if (res.count == 1) {
						$("span.idsuccess").text("사용불가");
						$("#loginid").val("");
					} else {
						$("span.idsuccess").text("사용가능");
					}
				}

			})
		})

		$("#loginid").keydown(function() {
			$("span.idsuccess").text("");
		})

		$("#pass2").keyup(function() {
			var pass1 = $("#pass").val();
			var pass2 = $("#pass2").val();
			if (pass1 == pass2) {
				$("span.passsuccess").text("일치");
			} else {
				$("span.passsuccess").text("비밀번호가 다릅니다.");
			}
		})
	})
	
	function check() {
		//사진
		if ($("#myphoto").val() == '') {
			alert("사진을 넣어주세요");
			return false;
		}
		//중복체크
		if ($("span.idsuccess").text() != '사용가능') {
			alert("아이디 중복체크 해주세요");
			return false;
		}
		//비밀번호
		if ($("span.passsuccess").text() != '일치') {
			alert("비밀번호가 서로 다릅니다");
			return false;
		}
	}
		
	
</script>
</head>
<body>
<div style="margin: 30px 100px; width: 800px;">
	<form action="insert"  method="post" onsubmit="return check()" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th width="100" class="table-dark" valign="middle">사진선택</th>
				<td style="width: 250px;" align="center">
					<input type="file" name="myphoto" id="myphoto" style="display: none;">
					<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
					<br><br>
					<img id="showimg">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark" valign="middle">아이디</th>
				<td>
				<div class="d-inline-flex">
					<input type="text" name="id" id="loginid" maxlength="8" class="form-control"
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
					required="required" style="width:140px;" placeholder="숫자 4자리">
					<input type="password" name="pass2" id="pass2" maxlength="18" class="form-control"
					required="required" style="width:140px; margin-left: 10px;" placeholder="비밀번호확인">
					<span class="passsuccess" style="margin-left: 10px; font-size: 10pt; 
					margin-top: 10px; color: green;"></span>
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
					<button type="button" class="btn btn-outline-danger" onclick="location.href='form'">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>

</body>
</html>