<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.divclass{
	width: 2000px;
}

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
	margin: 20px 30px;
	font-family: IBM Plex Sans KR;
	width: 1000px;
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
	color: green;
	margin-left: 5px;
	cursor: pointer;
}

i.adel{
	margin-left: 20px;
	color: red;
	cursor: pointer;
}

b.acount{
	cursor: pointer;
}

span.icon{
	margin-left: 20px;
	color: red;
	cursor: pointer;
}

span.iconsu{
	color: green;
	margin-left: 10px;
	cursor: pointer;
}

b.acount{
	font-size: 10pt;
}

.alist{
	font-size: 12pt;
}
</style>
<script type="text/javascript">

	$(function() {
		list();
		
		var num = $("#num").val();
		var currentPage = $("#currentPage").val();
		
		$("#btnsend").click(function() {
			var nickname = $("#nickname").val().trim();
			var content = $("#content").val().trim();
			
			if(nickname.length==0){
				alert("닉네임 입력후 저장해주세요");
				return;
			}
			
			if(content==""){
				alert("댓글 입력후 저장해주세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"smartanswer/insertanswer.jsp",
				dataType:"html",
				data:{
					"num":num,
					"nickname":nickname,
					"content":content,
					"currentPage":currentPage
				},
				success:function(){
					
					//alert("success");
					$("#nickname").val("");
					$("#content").val("");
					list();
				}
			})
		})
		
		$(document).on("click","i.adel",function(){
			var ans = confirm("정말 삭제하시겠습니까?");
			
			if(ans){
				var idx = $(this).attr("idx");
				/* alert(idx); */
				
				$.ajax({
					type : "get",
					dataType : "html",
					url : "smartanswer/deleteanswer.jsp",
					data : {
						"idx" : idx
					},
					success : function() {
						swal("성공!", "댓글이 삭제되었습니다", "success");
						list();

					}
				});
			}
			
		
		});
		
		$(document).on("click","i.amod",function(){
			//$("#myModal").modal("show");
			idx = $(this).attr("idx");
			//alert(idx);
			$.ajax({
				type : "get",
				dataType : "json",
				url : "smartanswer/jsonupdateform.jsp",
				data : {
					"idx" : idx
				},
				success : function(res) {
					
					//$("#idx").val(res.idx);
					$("#unickname").val(res.nickname);
					$("#ucontent").val(res.content);
					
					list();
				}
				
			});
			
			$("#myModal").modal("show");
		});
		
		$("#btnupdate").click(function() {
			//var idx = $("#idx").val();
			var nickname = $("#unickname").val();
			var content = $("#ucontent").val();
			
			/* alert(idx+","+nickname+","+content); */
			
			$.ajax({
				type:"post",
				dataType : "html",
				url : "smartanswer/updateanswer.jsp",
				data : {
					"idx" : idx,
					"nickname":nickname,
					"content":content
				},
				success:function(){
					
					list();
				}
			})
		});
		
	});

	function funcdel(num, currentPage) {
		//alert(num+","+currentPage);
		
		var ans = confirm("정말 삭제하시겠습니까?");
		
		if(ans){
			location.href='smartboard/deleteaction.jsp?num='+num+'&currentPage='+currentPage;
		}
	}
	
	function list() {
		//alert($("#num").val());
		
		$.ajax({
			type:"get",
			url:"smartanswer/listanswer.jsp",
			dataType:"json",
			data:{
				"num":$("#num").val()
			},
			success:function(res){
				//alert(res.length);
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res,function(idx,item){
					s+="<div>"+item.nick+" | "+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-trash adel' idx="+item.idx+"></i></span>";
					s+="<span class='iconsu'><i class='bi bi-pencil-square amod' idx="+item.idx+"></i></span>";
					s+="</div>";
				});
				
				$("div.alist").html(s);
			}
		})
	}

</script>
</head>

<body>

	<jsp:useBean id="dao" class="data.dao.SmartDao"/>
   <%
      String num=request.getParameter("num");
      String currentPage=request.getParameter("currentPage");
      
      //조회수1증가
      dao.updateRead(num);
      //dto가져오기
      SmartDto dto = dao.getData(num);
      
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   %>
   
   <div  style="margin: 1px 100px; width: 500px;">
      <table class="table">
         <caption align="top"><h5><b>
             &nbsp;<%=dto.getSubject() %>
         </b></h5></caption>
         
         <tr>
           <td>
              <b style="font-size: 12pt;"><%=dto.getWriter() %></b><br>
              <span class="day" style="font-size: 10pt;"><%=sdf.format(dto.getWriteday()) %>
              &nbsp;&nbsp;조회  <%=dto.getReadcount() %></span>
           </td>
         </tr>
         
         <tr height="150">
            <td>
              <%=dto.getContent().replace("\n", "<br>") %>
            </td>
         </tr>
       <tr>
            <td colspan="5">
               <b class="acount">댓글<span>0</span> </b>
               
               <div class="alist">
                  댓글목록
               </div>
               
               <div class="aform d-inline-flex">
                  <input type="hidden" id="num" value="<%=num%>">
                  <input type="hidden" id="currentPage" value="<%=currentPage%>">
                  
                  <input type="text" id="nickname" class="form-control" style="width: 100px"
                  placeholder="닉네임">
                  <input type="text" id="content" class="form-control" style="width: 300px"
                  placeholder="댓글메세지">
                  <button type="button" id="btnsend" class="btn btn-primary">저장</button>
               </div>
            </td>
         </tr>
         <tr>
            <td style="float: right; width: 500px;">
              <button type="button" class="btn btn-info btn-sm" 
              onclick="location.href='index.jsp?main=smartboard/smartform.jsp'"><i class="bi bi-pencil-fill"></i>글쓰기</button>
              <button type="button" class="btn btn-success btn-sm" 
              onclick="location.href='index.jsp?main=smartboard/boardlist.jsp'"><i class="bi bi-card-list"></i>목록</button>
              <button type="button" class="btn btn-warning btn-sm" 
              onclick="location.href='index.jsp?main=smartboard/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'"><i class="bi bi-pencil-square"></i>수정</button>
              <button type="button" class="btn btn-danger btn-sm" 
              onclick="funcdel(<%=num%>,<%=currentPage%>)"><i class="bi bi-trash"></i>삭제</button>
            </td>
         </tr>
      </table>
   </div>
   <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="updateform d-inline-flex">
        	<input type="hidden" id="idx">
        	<input type="text" id="unickname" style="width: 100px;">
        	<input type="text" id="ucontent" style="width: 300px;">&nbsp;&nbsp;&nbsp;
        	<button type="button" class="btn btn-danger" id="btnupdate">수정</button>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>