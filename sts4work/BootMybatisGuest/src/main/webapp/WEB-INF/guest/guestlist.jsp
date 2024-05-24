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
	div{
		font-family: IBM Plex Sans KR;
	}
	
	img.photo{
		cursor: pointer;
	}
</style>
<script type="text/javascript">

	$(function() {
		$("img.photo").click(function() {
			$("#photos").trigger("click");
		});
		
		$("#btnsave").click(function() {
			if($("#nick").val()==''){
				alert("닉네임을 입력해주세요");
				return;
			}
			if($("#pass").val()==''){
				alert("비밀번호를 입력해주세요");
				return;
			}
			if($("#content").val()==''){
				alert("내용을 입력해주세요");
				return;
			}
			
			//데이터 전송
			var s = $("#frm").serialize();
			
			//insert
			$.ajax({
				type:"post",
				dataType:"json",
				url:"insert",
				data:s,
				success:function(res){
					alert(res.msg);
					
					location.reload();
					$("#nick").val('');
					$("#pass").val('');
					$("#content").val('');
				}
			})
		});
		
		$("#photos").change(function() {
			
			var fdata = new FormData();
			var inputFile = $("#photos");
			var files = inputFile[0].files;
			
			if(files.length==0){
				return false;
			}
			
			for(var i=0;i<files.length;i++){
				console.log(i);
				fdata.append("photos",files[i]);			
			}
			
			$.ajax({
				url:"upload",
				processData:false, /* 서버전달 데이터는 query String 이라는 형태로 전달된다, 파일 전송의 경우는 이를 하지 말아야한다 */
				contentType:false, /* enctype이 원래 기본설정이 application/x.www 인데 multipart/form-data로 변경하는것이 false */
				type:"post",
				dataType:"json",
				data:fdata,
				success:function(res){
					console.log("파일명들 확인:"+res.photoname)
				}
			})
		})
	})
	
</script>
</head>
<body>
	<div style="margin: 100px 100px;">
		<h4>원하는 사진들을 등록하세요
			<input type="file" name="photos" id="photos" multiple="multiple" style="display: none;">
			&nbsp;
			<img alt="" src="../guestphoto/imageup.png" style="width: 100px;" class="photo">
		</h4>
		<br>
		<form id="frm">
			<table class="table" style="width: 700px;">
				<tr>
					<th width="60" style="text-align: center;" valign="middle">닉네임</th>
					<td>
						<input type="text" class="form-control input-sm" style="width: 150px;" id="nick" name="nick">
					</td>
					<th width="100" style="text-align: center;" valign="middle">비밀번호</th>
					<td>
						<input type="password" class="form-control input-sm" style="width: 150px;" id="pass" name="pass">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="d-inline-flex">
							<textarea style="width: 550px; height: 100px;" class="from-control" id="content" name="content"></textarea>&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" style="width: 100px; height: 100px;" id="btnsave">저장</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
		
		<hr>
		<c:forEach var="a" items="${list }">
			<table class="table" style="width: 600px;">
				<tr>
					<td>
						<b>${a.nick }</b>&nbsp;&nbsp;
						<span>작성일 | <fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<c:if test="${a.photo!='no' }">
							<c:forTokens items="${a.photo }" delims="," var="imp">
								<a href="../guestphoto/${imp }" style="text-decoration: none;">
									<img alt="" src="../guestphoto/${imp }" style="width: 100px; border: 1px solid gray; border-radius: 200px;">
								</a>
							</c:forTokens>
						</c:if>
						
						<pre style="font-family: IBM Plex Sans KR;">
							<h6>${a.content }</h6>
						</pre>
						<hr>
						<button type="button" class="btn btn-dark btn-sm" onclick="location.href='updateform?num='+${a.num}';'">수정</button>
						<button type="button" class="btn btn-outline-dark btn-sm" onclick="del(${a.num})">삭제</button>
						
						<script type="text/javascript">
							function del(num) {
								let pass = prompt("비밀번호를 입력해주세요");
								$.ajax({
									type:"get",
									dataType:"json",
									url:"delete",
									data:{
										"num":num,
										"pass":pass
									},
									success:function(data){
										if(data.st==1){
											alert("삭제되었습니다.");
											location.reload();
										}else{
											alert("비밀번호가 맞지 않습니다.");
										}
									}
								});
							}
						</script>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>