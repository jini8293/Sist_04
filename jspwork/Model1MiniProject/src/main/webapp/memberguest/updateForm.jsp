<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   #preshow{
     position: absolute;
     left: 800px;
     top: 70px;
   }
   
   i.camera{
   	cursor: pointer;
   }
</style>
<script type="text/javascript">

$(function() {
	$("i.camera").click(function() {
		$("#photo").trigger("click");
	})
})


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader(); 
        reader.onload = function (e) {
       
            $('#preshow').attr('src', e.target.result);
            
        }                   
        reader.readAsDataURL(input.files[0]);
       
    }
}

</script>
<%

	//num,currentPage
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	
	GuestDao dao = new GuestDao();
	GuestDto dto = dao.getData(num);

%>
</head>
<body>

<div style="margin: 50px 130px; width: 600px;">
	<form action="memberguest/updateAction.jsp" method="post" enctype="multipart/form-data">
	<!-- num hidden: 페이징 처리시는 currentPage도 hidden처리 -->
	<input type="hidden" name=num  value="<%=num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
		<table class="table table-bordered">
			<caption align="top">
				<b>방명록 수정</b>&nbsp;&nbsp;
				<i class="bi bi-camera camera fs-3" style="margin-top: 10px;"></i>
				<input type="file" name="photo" id="photo" style="visibility: hidden;" onchange="readURL(this)">
			</caption>
			
			<tr>
				<td>
					<textarea style="width: 500px; height: 100px;"
					name="content" required="required"
					class="form-control"><%=dto.getContent() %></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-outline-warning"
					style="width: 100px; height: 100px;">수정</button>
				</td>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-dark"
					style="width: 100px; height: 50px;" onclick="history.back()">이전</button>
	</form>
	<img id="preshow">
	<img id="showing" style="position: absolute; left: 800px; top: 100px; max-width: 200px;"
src="<%=(dto.getPhotoname()==null?"":"save/"+dto.getPhotoname())%>">
</div>
</body>
</html>