<%@page import="simpleboardanswer.model.SimpleAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="simpleboard.data.SimpleBoardDao"%>
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
.div1{
	border: 1px solid lightgray;
	width: 2000px;
	font-family: IBM Plex Sans KR;
	border-radius: 10px;

}

.div2,.div3{
	margin: 50px 30px;
	font-family: IBM Plex Sans KR;
}

.div5{
	margin: 50px 100px;
	font-family: IBM Plex Sans KR;
}

.div4{
	margin: 30px;
	font-family: IBM Plex Sans KR;
}

span.aday{
	float: right;
	font-size: 0.8em;
	color: #bbb;
}

i.amod{
	float: right;
	cursor:pointer;
	color: green;
	margin-left: 10px;
}

i.adel{
	float: right;
	cursor:pointer;
	color: red;
}

b.acount{
	cursor: pointer;
}

</style>

<script type="text/javascript">

$(function() {
	
	//ajax로 insert(댓글)
	var num = $("#num").val();
	//alert(num);
	
	$(".aupdateform").hide();
	
	list();
	
	$("#btnsend").click(function() {
		
		var nickname= $("#nickname").val().trim();
		var content= $("#content").val().trim();
		
		if(nickname==''){
			alert("닉네임을 입력후 저장해주세요");
			return;
		}
		
		if(content==''){
			alert("내용을 입력후 저장해주세요");
			return;
		}
	
		$.ajax({
			type: "post",
			dataType: "html",
			url: "../simpleboardanswer/insertAnswer.jsp",
			data:{"num":num,"nickname":nickname,"content":content},
			success: function() {
				
				//기존 입력값 지우기
				$("#nickname").val("");
				$("#content").val("");
				
				list();
			}
		});
	});
	
	$("b.acount").click(function(){
		$(".aupdateform").hide();
		$(".aform").toggle();
	})
	
	
	//댓글 리스트의 수정아이콘 누르면 수정 댓글 창에 해당idx의 내용 띄우기
	$(document).on("click",".amod",function(){
		var idx = $(this).attr("idx");
		/*alert(idx);*/
		$("#idx").val(idx);
		
		$.ajax({
			type : "get",
			dataType : "json",
			url : "../simpleboardanswer/oneDataAnswer.jsp",
			data : {
				"idx" : idx
			},
			success : function(res) {
				
				$("#idx").val(res.idx);
				$("#unickname").val(res.nickname);
				$("#ucontent").val(res.content);
				
				$(".aupdateform").show();
				$(".aform").hide();
				list();

			}
		});
	});
	
	//수정
	$("#btnupdate").click(function(){
		var idx = $("#idx").val();
		var nickname = $("#unickname").val();
		var content = $("#ucontent").val();
		
		/* alert(idx+","+nickname+","+content); */
		
		$.ajax({
			type:"post",
			dataType : "html",
			url : "../simpleboardanswer/updateAnswer.jsp",
			data : {
				"idx" : idx,
				"nickname":nickname,
				"content":content
			},
			success:function(){
				$(".aupdateform").hide();
				$(".aform").show();
				list();
			}
		})
		
	})

	$(document).on("click",".adel",function(){
		var idx = $(this).attr("idx");
		/* alert(idx); */
		
		$.ajax({
			type : "get",
			dataType : "html",
			url : "../simpleboardanswer/deleteAnswer.jsp",
			data : {
				"idx" : idx
			},
			success : function() {
				list();

			}
		});
	});
	
});

function list() {
	console.log("list num="+$("#num").val());
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"../simpleboardanswer/listAnswer.jsp",
		data:{"num":$("#num").val()},
		success:function(res){
			//댓글 갯수 출력
			$("b.acount>span").text(res.length);
			
			var s = "";
			$.each(res,function (idx, item){
				s+="<div><b>"+item.nickname+"</b><i class='bi bi-x-lg adel' idx="+item.idx+"></i>"
				s+="<i class='bi bi-pencil-square amod' idx="+item.idx+"></i><br>"+item.content;
				s+="<span class='aday'>"+item.writeday+"</span></div><hr>";
			});
			$("div.alist").html(s);
		}
	})
	
}

</script>
</head>
<%
String num = request.getParameter("num");
SimpleBoardDao dao = new SimpleBoardDao();
SimpleBoardDto dto = dao.getData(num);
dao.updateRCount(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<body>

	<form action="addForm.jsp" method="post">
	<input type="hidden" id="num" value="<%=num%>">
	<div style="margin: 50px 100px; width: 600px" class="div1">
		<div class="div2">
			<h3><%=dto.getSubject() %></h3>
		
			<b><%=dto.getWriter() %></b>
			
			<span  style="color: gray; font-size: 9pt; margin-left: 330px;"><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;
			조회 <%=dto.getReadcount() %></span>
			<hr>
		</div>
		<div class="div3">
			
			<p><%=dto.getContent().replace("\n", "<br>") %></p>
			<br>
			<hr>
		</div>
		<div class="div4">
			<b class="acount" id="alist">댓글&nbsp;&nbsp;<span>0</span></b><br><br>
			<div class="alist" style="font-size: 10pt;">
				댓글목록
				                               
			</div>
			<br>
			<div class="aform input-group">
				<input type="text" id="nickname" class="form-control"
				style="width: 100px;" placeholder="닉네임">
				<input type="text" id="content" class="form-control"
				style="width: 300px; margin-left: 10px;" placeholder="댓글 메세지">
				<button type="button" id="btnsend" class="btn btn-success btn-sm" 
				>저장</button>
			</div>
			
			<!-- 수정창 -->
			<div class="aupdateform input-group" >
				
				<input type="text" id="unickname" class="form-control"
				style="width: 100px;" placeholder="닉네임">
				<input type="text" id="ucontent" class="form-control"
				style="width: 300px; margin-left: 10px;" placeholder="댓글 메세지">
				<button type="button" id="btnupdate" class="btn btn-danger btn-sm" style="border-bottom-right-radius: 5px; border-top-right-radius: 5px;"
				>수정</button>
				<input type="hidden" id="idx" >
			</div>
		</div>
		
		</div>
		<div class="div5">
			<button type="submit" class="btn btn-success"><i class="bi bi-pencil"></i>  글쓰기</button>
			<button type="button" class="btn btn-outline-success" style="margin-left: 335px;"  onclick="location.href='boardList.jsp'">목록</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='updatepassForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='deletepassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
		</div>
	</form>
</body>
</html>