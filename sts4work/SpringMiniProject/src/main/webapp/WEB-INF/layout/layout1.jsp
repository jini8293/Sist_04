<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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

	div.layout div{
		font-family: IBM Plex Sans KR;
	}
	
	div.layout div.title{
		position: absolute;
		top: 10px;
		left: 250px;
		height: 100px;
	}
	
	div.layout div.menu{
		position: absolute;
		top: 150px;
		left: 250px;
		height: 100px;
	}
	
	div.layout div.info{
      position: absolute;
      top: 300px;
      left: 50px;
      height: 300px;
      width: 270px;
      border: 5px solid purple;
      border-radius: 30px;
      padding: 30px 20px;
   }
	
	div.layout div.main{
		position: absolute;
		top: 290px;
		left: 250px;
		height: 1000px;
		width: 1000px
	}

</style>
</head>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title" />
		</div>
		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
		<div class="info">
			<tiles:insertAttribute name="info" />
		</div>
	</div>
</body>
</html>