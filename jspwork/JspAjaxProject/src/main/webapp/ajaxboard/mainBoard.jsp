<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
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
<title>Insert title here</title>
<style type="text/css">
div.list,div.detail{
	position: absolute;
	left: 100px;
	top: 100px;

}

div.addform, div.updateform{
	position: absolute;
	left: 900px;
	top: 100px;

}

div.list *,div.addform,div.detail *,div.updateform{
	font-family: Black Han Sans;
	font-weight: lighter;
	font-size: 13pt;
}

.detail{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		list();
		
		//입력폼 처음에는 안보이게 
		$("div.addform").hide();
		$("div.updateform").hide();
		
		//글쓰기버튼 누르면보이게
		$("#btnwrite").click(function() {
			$("div.addform").slideToggle('slow');
		});
		
		$("#btnadd").click(function() {
			var writer= $("#writer").val();
			var subject= $("#subject").val();
			var avata= $("#avata").val();
			var content= $("#content").val();
		
			$.ajax({
				type: "post",
				dataType: "html",
				url: "insertBoard.jsp",
				data:{"writer":writer,"subject":subject, "avata":avata, "content":content},
				success: function() {
					list();
					
					$("#writer").val("");
					$("#subject").val("");
					$("#avata").val("../image/avata/b1.png");
					$("#content").val("");
				}
			});
		});
		
		$("#update").click(function() {
			var unum = $("#unum").val();
			var uwriter= $("#uwriter").val();
			var usubject= $("#usubject").val();
			var uavata= $("#uavata").val();
			var ucontent= $("#ucontent").val();
			
				$.ajax({
					type : "post",
					url : "updateBoard.jsp",
					dataType : "html",
					data : {
						"uwriter":uwriter,
						"usubject":usubject,
						"uavata":uavata,
						"ucontent":ucontent,
						"unum":unum
					},
					success : function() {

						list();

						$("div.list").show();
						$("div.detail").hide();
						$("div.updateform").hide();
					}
				});
			});
		
		//제목 클릭시 내용보기
		$(document).on("click","span.detail",function(){
			var num = $(this).attr("num");
			//alert(num);

			$.ajax({
				type:"get",
				dataType:"json",
				data:{
					"num":num
				},
				url:"detailBoard.jsp",
				success:function(res){
					var s="<table class='table table-bordered' style='width:500px;'>";
		               s+="<caption align='top'><b>[ DETAIL PAGE ]</b></caption>";
		               s+="<tr class='table-input'>";
		               s+="<td><b style='font-size:2em'>"+res.subject+"</b>";
		               s+="<br>"+res.writer+"<br>";
		               s+="<span style='float:right; color:gray;'>"+res.writeday+"</span></td></tr>";
		               s+="<tr><td>";
		               s+="<img src='"+res.avata+"' align='left' hspace='20'>";
		               s+="<pre>"+res.content+"</pre></td></tr>";
		               
		               //버튼들
		               s+="<tr><td align='right'>";
		               s+="<button type='button' class='btn btn-success btn-sm btnlist' style='margin-right:10px;'>목록</button>"
		               s+="<button type='button' class='btn btn-warning btn-sm btnupdate' style='margin-right:10px;' num='"+res.num+"'>수정</button>"
		               s+="<button type='button' class='btn btn-danger btn-sm btndelete' num='"+res.num+"'>삭제</button>"
		               s+="</td></tr>";
		               s+="</table>";
		               
		               $("div.detail").html(s);
		               
		            $("div.addform").hide();
					$("div.list").hide();
					$("div.detail").show();
				}
			});
		});
		
		//목록버튼 누르면 상세보기 사라지고 목록 나오기
		$(document).on("click",".btnlist",function(){
			$("div.detail").hide();
			$("div.list").show();
		});
		
		//삭제
		$(document).on("click",".btndelete",function(){
			var num = $(this).attr("num");
			/* alert(num); */
			$.ajax({
				type : "get",
				dataType : "html",
				url : "boardDelete.jsp",
				data : {
					"num" : num
				},
				success : function() {
					list();
					$("div.detail").hide();
					$("div.list").show();

				}
			});

		});
		
		//수정
		$(document).on("click",".btnupdate",function(){
			var num = $(this).attr("num");
			//alert(num);
			//폼의 unum에 num넣기
			$("#unum").val(num);
			$.ajax({
				type : "get",
				dataType : "json",
				url : "detailBoard.jsp",
				data : {
					"num" : num
				},
				success : function(res) {

					//수정폼 태그안에 넣어준다
					$("#unum").val(res.num);
					$("#uwriter").val(res.writer);
					$("#ucontent").val(res.content);
					$("#usubject").val(res.subject);
					$("#uavata").val(res.avata);
					

					$("div.updateform").show();
				}
			});
		});
		
	//수정버튼 클릭
	

	}); 
	
	function list() {
		$.ajax({
			type : "get",
			dataType : "json",
			url : "listBoard.jsp",
			success : function(data) {

				//alert(data.length);
				
				var s = "";
				s+= "<table class='table table-bordered' style='width:700px;'><caption align='top'><b>[ AjaxBoard 목록 ]</b></caption>";
				s+="<tr><th class='table-dark' style='text-align:center;' width='80'>No.</th>";
				s+="<th class='table-dark' style='text-align:center;' width='350'>SUBJECT</th>";
				s+="<th class='table-dark' style='text-align:center;' width='180'>WRITER</th>";
				s+="<th class='table-dark' style='text-align:center;' width='180'>WRITEDAY</th></tr>";
				if (data.length == 0) {
					s += "<tr><td colspan='4' align='center'>";
					s += "<b>저장된 글이 없습니다</b></td></tr>";
					
				} else {
					$.each(data,function(i, ele) {
						s+="<tr><td align='center'>"+(data.length-i)+"</td>";
						s+="<td align='center'><span num='"+ele.num+"' class='detail'>"+ele.subject+"</span></td>";
						s+="<td align='center'>"+ele.writer+"</td>";
						s+="<td align='center'>"+ele.writeday+"</td></tr>";
					});
				}
				s+="</table>";
				$("#writeform").html(s);
			}
		});
	}
</script>
</head>
<body>
<div class="list">
	<button type="button" class="btn btn-dark" id="btnwrite">글쓰기</button>
	<div id="writeform">list</div>
</div>

<div class="addform">
	<form action="#">
		<table class="table table-bordered">
		<caption align="top"><b>게시글 추가</b></caption>
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">작성자</th>
			<td>
				<input type="text" id="writer" style="width: 120px;"
				class="form-control">
			</td>
		</tr>
		
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">제목</th>
			<td>
				<input type="text" id="subject" style="width: 270px;"
				class="form-control">
			</td>
		</tr>
		
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">AVATA</th>
			<td>
				<select id="avata" class="form-control" style="width: 100px;">
					<option value="../image/avata/b1.png">사랑해</option>
					<option value="../image/avata/b8.png">최고</option>
					<option value="../image/avata/b7.png">신남</option>
					<option value="../image/avata/b6.png">좌절</option>
					<option value="../image/avata/b5.png">배고파</option>
					<option value="../image/avata/b2.png">심심해</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea style="width: 380px; height: 100px;" id="content"
				class="form-control"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-danger"
				id="btnadd"  style="text-align: center; font-weight: lighter;" valign="middle">DB추가</button>
			</td>
		</tr>
		</table>
	</form>
</div>

<div class="detail"></div>

<div class="updateform">
	<form action="#">
	<input type="hidden" id="unum">
		<table class="table table-bordered">
		<caption align="top"><b>게시글 수정</b></caption>
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">작성자</th>
			<td>
				<input type="text" id="uwriter" style="width: 120px;"
				class="form-control">
			</td>
		</tr>
		
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">제목</th>
			<td>
				<input type="text" id="usubject" style="width: 270px;"
				class="form-control">
			</td>
		</tr>
		
		<tr>
			<th class="table-dark" style="font-weight: lighter; text-align: center;" valign="middle">AVATA</th>
			<td>
				<select id="uavata" class="form-control" style="width: 100px;">
					<option value="../image/avata/b1.png">사랑해</option>
					<option value="../image/avata/b8.png">최고</option>
					<option value="../image/avata/b7.png">신남</option>
					<option value="../image/avata/b6.png">좌절</option>
					<option value="../image/avata/b5.png">배고파</option>
					<option value="../image/avata/b2.png">심심해</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea style="width: 380px; height: 100px;" id="ucontent"
				class="form-control"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-danger"
				id="update" style="text-align: center; font-weight: lighter;" valign="middle">수정</button>
			</td>
		</tr>
		</table>
	</form>
</div>

</body>
</html>