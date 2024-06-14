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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
	.login{
		position: absolute;
		left: 800px;
		top: 35px;
		width: 350px;
	}
	
	#btnlogin{
		margin-left: 600px;
	}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="/">
		<img alt="" src="${root }/image/oliveyoungtitle.jpg" style="width: 200px; margin-top: 30px;">	
	</a>
	<div class="login">
		<c:if test="${sessionScope.loginok==null }">
			<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='${root}/login/main'">Login</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null }">
			<b>${sessionScope.myid } 님이 로그인중</b>
			<button type="button" class="btn btn-danger" style="width: 100px;" onclick="location.href='${root}/login/logoutprocess'">Logout</button>
		</c:if>
	</div>
	
	<div class="container mt-3">
		<button type="button" class="btn btn-primary" data-bs-toggle="model"
		data-bs-target="#myModal" id="btnlogin">Ajax login</button>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content ">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h5 class="modal-title">로그인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="delnum">
	      	<div>
	      		<i class="bi bi-person-circle"></i>
	      		<input type="text" class="form-control" id="loginid" placeholder="아이디" style="width: 70px;">
	      	</div>
	      	
	      	<div>
	      		<i class="bi bi-check-all"></i>
	      		<input type="password" class="form-control" id="loginpass" placeholder="비밀번호" style="width: 120px;">
	      	</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">login</button>
	      	<button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>