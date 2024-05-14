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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<style type="text/css">
	div, pre{
	
	font-family: IBM Plex Sans KR;
	
	}
	
	#answer{
		margin-left: 5px;
		padding: 10px 20px;
		font-size: 1em;
	}
	
	i{
		cursor: pointer;
		float: right;
	}
</style>
</head>
<body>
<div style="margin: 100px 100px; width: 600px;">

	<table class="table table-bordered">
		<tr>
			<td>
				<h3><b>${dto.subject }</b></h3>
				<span style="float: right;">조회 &nbsp; ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="color: gray; float: right;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> 
					</span>
				</span>
				<br>
				<h6><b>${dto.writer }</b></h6>
			</td>
		</tr>
		<c:if test="${dto.photo!='no' }">		
		<tr>
			<td>
				<div>
				 	
				 		<c:forTokens var="f" items="${dto.photo }" delims=",">
				 			<div>
				 				<a href="download?clip=${f }" style="text-decoration: none;">
				 					<i class="bi bi-download"></i>&nbsp;
				 					<span>${f }</span>
				 				</a>
				 			</div>
				 		</c:forTokens>
				 	
				</div>
			</td>
		</tr>
		</c:if>
		<tr>
			<td>
				<pre>${dto.content }</pre>
				<br>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
						<img alt="" src="../photo/${im }" style="width: 200px;" class="img-thumbnail">&nbsp;&nbsp;
					</c:forTokens>
				</c:if> 
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				<div id="answer">
				<b>댓글 ${acount }개</b><br><br>
				<c:forEach var="a" items="${ alist}">
				<span style="color: gray;">------------------------------------------------------------------------------------</span><br>
					${a.nickname } > ${a.content }
					&nbsp;&nbsp;
					<span style="color: gray; font-size: 0.8em" ></span>
					<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					<i class="bi bi-trash del" idx="${a.idx }"></i>
					<i class="bi bi-pencil-square" id="up"></i>
					<input type="hidden" name="idx" value="${a.idx }" id="idx">
					<br>
				</c:forEach>
				</div>
				<br>
				<form action="ainsert" method="post">
					<input type="hidden" name="num" value="${dto.num }">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="hidden" name="num" value="${dto.num }">
					<div class="d-inline-flex">
						<b style="margin-left: 10px; margin-top: 5px;">닉네임</b>
						<input type="text" name="nickname" class="form-control" style="width: 100px; margin-left: 10px;" required="required">
						<b style="margin-left: 10px;  margin-top: 5px;">비밀번호</b>
						<input type="password" name="pass" class="form-control" style="width: 100px; margin-left: 10px;" required="required">
					</div>
					<br><br>
					<div class="d-inline-flex">
						<input type="text" name="content" class="form-control" style="width: 500px;" required="required" placeholder="댓글내용을 입력해주세요">
						<button type="submit" class="btn btn-outline-info" style="margin-left: 10px;">확인</button>
					</div>
				</form>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<button type="button" class="btn btn-outline-warning" onclick="location.href='writeform'">글쓰기</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='list'">목록</button>
				<button type="button" class="btn btn-success" onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-danger" onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(".del").click(function() {
		var idx= $(this).attr("idx");
		//alert(idx);
		var pass = prompt("비밀번호를 입력해주세요.");
		if(pass==null){ //취소시 함수 종료
			return;
		}
		$.ajax({
			type:"get",
			url:"adelete",
			data:{
				"idx":idx,
				"pass":pass
			},
			dataType:"json",
			success:function(res){
				if(res.check==1){
					alert("댓글이 삭제되었습니다.");
					location.reload();
				}else{
					alert("비밀번호가 맞지 않습니다.");
				}
			}
				
				
		})
				
			
			
		});
</script>
</body>
</html>