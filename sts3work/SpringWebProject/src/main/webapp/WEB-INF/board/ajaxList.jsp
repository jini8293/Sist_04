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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	img.photo{
		width: 200px;
		height: 200px;
		margin-left: 10px;
		border: 2px solid gray;
		border-radius: 20px;
		box-shadow: 5px 5px 5px gray;
		cursor: pointer;
	}
	
	div.list2{
		width: 800px;
		margin-top: 20px;
		border: 1px dotted gray;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		list1();
		
		$("#list1").click(function() {
			list1();
		});
		
		$("#list2").click(function() {
			$("#list2").css("color","red");
			$("#list1").css("color","black");
			
			$.ajax({
				type:"get",
				url:"../ajax/list2",
				dataType:"json",
				success:function(data){
					var s = "<b>"+data.length+" 개의 자료가 있습니다</b><br><br>";
					
					$.each(data,function(i,a){
						var photo = a.photo.split(",");
						s+="<div class='list2'>";
						s+="<span class='title'>제목: "+a.subject+"</span><br>";
						s+="<span class='writer'>작성자: "+a.writer+"</span><br>";
						s+="<span class='content'><pre>"+a.content+"</pre></span><br>";
					})
					s+="</div>";
					
					$("#showboard").html(s);
				}
				
			});
			
		});
	});
	
	function list1() {
		$("#list1").css("color","red");
		$("#list2").css("color","black");
		
		$.ajax({
			type:"get",
			url:"../ajax/list1",
			dataType:"json",
			success:function(data){
				var s = "<b>"+data.length+" 개의 자료가 있습니다</b><br><br>";
				s+="<table class='table table-bordered'>";
				s+="<tr>";
				$.each(data,function(i,a){
					var photo = a.photo.split(",");
					s+="<td align='center'>";
					s+="<img class='photo' src='../photo/"+photo[0]+"'><br>";
					s+="제목: "+a.subject+" (총 사진갯수: "+photo.length+"개)<br>";
					s+="작성자: "+a.writer+"<br>";
					s+="<span class='day'>작성일: "+a.writeday+"</span>"
					s+="</td>";
					
					if((i+1)%3==0){
						s+="</tr><tr>";
					}
				})
				s+="</table>";
				
				$("#showboard").html(s);
			}
			
		})		
	}
</script>
</head>
<body>
	<div class="alert alert-danger" style="font-size: 20pt; font-weight: bold; width: 800px; margin: 100px 50px;">
		Ajax로 Board목록 출력하기
		<i class="bi bi-view-list" style="margin-left: 200px; cursor: pointer;" id="list1"></i>
		<i class="bi bi-list" style="margin-left: 5px; cursor: pointer;" id="list2"></i>
	</div>
	<div id="showboard" style="margin: 100px 50px;"></div>
</body>
</html>