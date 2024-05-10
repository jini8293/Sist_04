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
<h3 class="alert alert-info">Ex1번 예제</h3>
<br>
<button type="button" id="btn1" class="btn btn-info">list1 Json 데이터 출력하기</button>
<div id="out1"></div>

<script type="text/javascript">
	$("#btn1").click(function() {
		$.ajax({
			type:"get",
			dataType:"json",
			url:"list1",
			success:function(res){
				$("#out1").append("이름: "+res.name+"<br>");
				$("#out1").append("전화번호: "+res.hp+"<br>");
				$("#out1").append("주소: "+res.addr);
			}
		})
	})
</script>
</body>
</html>