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

	ul.menu{
		list-style: none;
		font-family: IBM Plex Sans KR;
	}

	ul.menu li{
		width: 130px;
		float: left;
		border: 1px solid gray;
		height: 60px;
		text-align: center;
		line-height: 60px;
		margin-right: 10px;
		font-size: 24px;
		background-color: #ffc;
		cursor: pointer;
	}
	
	ul.menu li a{
		color: black;
		text-decoration: none;
	}

</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<ul class="menu">
		<li>
			<a href="${root }/">Home</a>
		</li>
		<li>
			<a href="${root }/ipgo/writeform">상품등록</a>
		</li>
		<li>
			<a href="${root }/ipgo/list">상품목록</a>
		</li>
		<li>
			<a href="${root }/member/myinfo">MyPage</a>
		</li>
		<li>
			<a href="${root }/member/form">회원가입</a>
		</li>
		<li>
			<a href="${root }/board/list">게시팜</a>
		</li>
		<li>
			<a href="${root }/load/map">오시는길</a>
		</li>
	</ul>
</body>
</html>