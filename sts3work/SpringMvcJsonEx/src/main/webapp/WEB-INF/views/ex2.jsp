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
<h3 class="alert alert-info">Ex2번 예제</h3>
<br>
<button type="button" id="btn1" class="btn btn-info">list2 Json 데이터 출력하기</button>
<div id="out1"></div>

</div>
<script type="text/javascript">
	$("#btn1").click(function() {
		$.ajax({
			type:"get",
			dataType:"json",
			url:"list2",
			success:function(data){
				
				var s = "";
				$.each(data, function(i,res) {
					s += "<br><figure>"
					s += "<img src='img/"+res.photo+"' style='width: 100px; height: 100px;'>";
					s += "<figcaption>";
					s += "<b>"+res.sangname+"</b></figcaption>";
					s += "</figure>"
					
				})
				$("#out1").html(s);
			}
		})
	})
</script>
</body>
</html>