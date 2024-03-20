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

	div.board{
		font-family: IBM Plex Sans KR;
		position: absolute;
		left: 10%;
		top: 10%;
	}
	
	div.board th{
		text-align: center;
	}
	
	div.list{
		width: 800px;
	}
	
	.detail{
		cursor: pointer;
	}
	
	

</style>
<script type="text/javascript">


	$(function() {
		list();

		$("div.addform").hide();
		$("div.updateform").hide();
		$("div.detailview").hide();
		//$("div.list").show();

		//이미지 선택시
		$("#selimage").change(function() {
			var im = $(this).val();

			//이미지명을 현재값에
			$("#image").val(im);

			//아래 이미지뷰에 이미지가 보이게
			var s = "<img src='"+im+"' width='50'>";
			$("#imgview").html(s);
		})

		//글쓰기div 띄우기
		$("#btnwrite").click(function() {
			$("div.addform").show();
			$("div.list").hide();
		})

		//insert
		$("#btninsert").click(function() {

			//name으로 가능
			/* var data = $("#addfrm").serialize();
			alert(data); */

			//id로 가능
			var writer = $("#writer").val();
			var subject = $("#subject").val();
			var story = $("#story").val();
			var image = $("#image").val();

			$.ajax({
				type : "post",
				dataType : "html",
				url : "insertWrite.jsp",
				data : {
					"writer" : writer,
					"subject" : subject,
					"story" : story,
					"image" : image
				},
				success : function() {
					list();
					$("#writer").val("");
					$("#subject").val("");
					$("#story").val("");
					$("#image").val("../image/avata/b1.png");

					$("#imgview").empty();
					$("div.addform").hide();
					$("div.list").show();

				}
			});
		});
		
		$(document).on("click",".detail",function(){
			var num = $(this).attr("num");
			//alert(num);
			
			$.ajax({
				type : "get",
				dataType : "json",
				url : "getdataWrite.jsp",
				data:{"num":num},
				success : function(data){
					$("span.title").html(data.subject);
					$("span.day").html(data.writeday);
					$("span.writer").html(data.writer);
					$("div.story").html("<pre>"+data.story+"</pre>");
					$("div.image").html("<img src='"+data.image+"' width='100'>");
					
					
					$("div.list").hide();
					$("div.detailview").show();
				}
			})
		
		});

	});

	function list() {
		$.ajax({
			type : "get",
			dataType : "json",
			url : "listWrite.jsp",
			success : function(data) {

				//alert(data.length);

				var s = "";
				s += "<table class='table table-bordered' style='width:700px;'><caption align='top'><b>[ AjaxWrite 목록 ]</b></caption>";
				s += "<tr><th class='table-dark' style='text-align:center;' width='80'>No.</th>";
				s += "<th class='table-dark' style='text-align:center;' width='350'>SUBJECT</th>";
				s += "<th class='table-dark' style='text-align:center;' width='180'>WRITER</th>";
				s += "<th class='table-dark' style='text-align:center;' width='180'>WRITEDAY</th>";
				s += "<th class='table-dark' style='text-align:center;' width='100'>LIKES</th></tr>";
				if (data.length == 0) {
					s += "<tr><td colspan='5' align='center'>";
					s += "<b>저장된 글이 없습니다</b></td></tr>";

				} else {
					$.each(data,function(i, ele) {
						s += "<tr><td align='center'>"+ (i + 1) + "</td>";
						s += "<td><span num='"+ele.num+"' class='detail'>"+ ele.subject+ "</span></td>";
						s += "<td align='center'>"+ ele.writer + "</td>";
						s += "<td align='center'>"+ ele.writeday+ "</td>";
						s += "<td align='center'>"+ ele.likes+ "</td></tr>";
					});
				}
				s += "</table>";
				$("#ajaxwrite").html(s);
			}
		});
	}
</script>
</head>
<body>
<!-- 추가 폼 -->
<div class="board addform" style="margin: 50px 100px; width: 400px;">
	<form id="addfrm">
		<table class="table table-bordered">
			<caption align="top"><b>글쓰기</b></caption>
			<tr>
				<th width="100" class="table-warning" valign="middle">작성자</th>
				<td>
					<input type="text" name="writer" id="writer"
					class="form-control" required="required" style="width: 130px;" >
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning" valign="middle">제목</th>
				<td>
					<input type="text" name="subject" id="subject"
					class="form-control" required="required" style="width: 250px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning" valign="middle">내용</th>
				<td>
					<textarea style="width: 300px; height: 100px;"
					name="story" id="story" required="required" class="form-control"></textarea>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning" valign="middle">이미지</th>
				<td>
					<input type="hidden" name="image" id="image" width="100%">
					<select id="selimage" style="width: 100px;" class="form-control">
						<option value="../image/avata/b1.png">사랑해</option>
						<option value="../image/avata/b2.png">우울함</option>
						<option value="../image/avata/b5.png">배고파</option>
						<option value="../image/avata/b6.png">좌절</option>
						<option value="../image/avata/b10.png">심심해</option>
						<option value="../image/avata/b8.png">최고</option>
					</select><br>
					<div id="imgview"></div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-outline-warning" id="btninsert">DB추가</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='mainPage.jsp'" >이전</button>
				</td>
			</tr>
		</table>
	</form>
</div>


<div class="board updateform">수정폼</div>

<div class="board list" style="margin: 1px 100px; ">
	<button type="button" class="btn btn-outline-dark" id="btnwrite"><i class="bi bi-pencil"></i>  글쓰기</button>
	<div id="ajaxwrite"></div>
</div>

<div class="board detailview">
	<table class="story table table-bordered" style="width:600px;">
		<caption align="top"><b>게시글 확인</b></caption>
		<tr>
			<td>
				<span class="title">제목</span>
				<span class="day" style="float: right; color: gray;">날짜</span>
			</td>
		</tr>
		
		<tr>
			<td>
				<span class="writer">작성자</span>
				<span class="likes" style="float: right;">
					<i class="bi bi-suit-heart-fill" style="color: red;"></i>
					<span class="su">0</span>
				</span>
			</td>
		</tr>
		
		<tr>
			<td style="height: 200px;" valign="top">
				<div class="story">내용</div>
				<div class="image">이미지</div>
			</td>
		</tr>
		
		<tr>
			<td >
				<button type="button" class="deletebtn btn btn-outline-danger btn-sm"
				style="float: right; margin-left: 5px;">삭제</button>
				<button type="button" class="updatebtn btn btn-outline-success btn-sm"
				style="float: right; margin-left: 5px;">수정</button>
				<button type="button" class="addbtn btn btn-outline-dark btn-sm"
				style="float: right; margin-left: 5px;">글쓰기</button>
				<button type="button" class="btn btn-outline-info btn-sm"
				onclick="location.href='mainPage.jsp'" 
				style="float: right; margin-left: 5px;">목록</button>
				
			</td>
		</tr>
	</table>
</div>
</body>
</html>