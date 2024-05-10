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
</head>
<body>
<div style="margin: 50px 50px;">
	<h3 class="alert alert-success">Ex3번 예제</h3>
	<br>
	<h4>메뉴이름을 입력후 엔터를 눌러주세요</h4>
	<input type="text" id="search" class="form-control" style="width: 150px;">
	<br><br>
	<h2 id="fname"></h2>
	<img alt="" src="" id="photo">
	
	<script type="text/javascript">
	$("#search").keyup(function(e) {
		if(e.keyCode==13){
			var sname = $(this).val();

			$.ajax({
				type:"get",
				dataType:"json",
				url:"list3",
				data:{"sname":sname},
				success:function(res){
					$("#fname").text(res.sname);
					$("#photo").attr("src","img/"+res.photo);
					$("#search").val('');
				}
			})
		}
		
	})
	</script>
</div>
</body>
</html>