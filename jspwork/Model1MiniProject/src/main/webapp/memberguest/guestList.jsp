<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dao.MemberDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

  span.day{
     float: right;
     font-size: 10pt;
     color: gray;
  }
  i.mod,i.del{
     cursor: pointer;
  }
</style>

<script type="text/javascript">
	$(function(){
	
		$("span.likes").click(function() {
		    var num = $(this).attr("num");
		    var tag = $(this);
		    $.ajax({
		        type: "get",
		        dataType: "json",
		        url: "memberguest/updateincreChu.jsp",
		        data: {
		            "num": num
		        },
		        success: function (count) {
		            tag.find('i.bi-heart').removeClass('bi-heart').addClass('bi-heart-fill');
		            tag.next().text(count.chu);
		            tag.next().next().animate({
		                "font-size": "20px"
		            }, 500, function () {
		                $(this).css("font-size", "0px");
		            });
		        }
		    });
		});

		
		$(".btndel").click(function() {
			var num = $(this).attr("num");
			var currentPage = $(this).attr("currentPage");
			//alert(num+"+"+currentPage);
			var yes = confirm("정말 삭제하시겠습니까?");
			
			if(yes){
				location.href = 'memberguest/deleteAction.jsp?num='+num+'&currentPage='+currentPage;
			}
		});
		
		//댓글부분은 무조건 처음에는 안보이게 처리
		$("div.answer").hide();
		
		//댓글 클릭시 댓글부분이 보였다 안보였다 하기
		$("span.answer").click(function(){
			$(this).parent().find("div.answer").toggle();
		})
		
		$(".andel").click(function() {
			var idx = $(this).attr("idx");
			var currentPage = $(this).attr("currentPage");
			//alert(idx+"+"+currentPage);
			var yes = confirm("정말 삭제하시겠습니까?");
			
			if(yes){
				location.href = 'memberguest/deleteAnswer.jsp?idx='+idx+'&currentPage='+currentPage;
			}
		});
		
		//수정아이콘 누르면 모달창
		$("i.anup").click(function() {
			var idx = $(this).attr("idx");
			//alert(idx);
			
			$("#idx").val(idx);
			$.ajax({
				type:"get",
				dataType:"json",
				url:"memberguest/answerContent.jsp",
				data:{
					"idx":idx
				},
				success:function(res){
					$("#idx").val(res.idx);
					$("#ucontent").val(res.story);
				}
			})
		})
		
		$("#btnupdate").click(function(){
			
			var idx = $("#idx").val();
			var ucontent= $("#ucontent").val();
			$.ajax({
				type : "post",
				url : "memberguest/updateAnswer.jsp",
				dataType : "html",
				data : {
					"idx":idx,
					"ucontent":ucontent
				},
				success : function() {

				location.reload();

				
				}
			});
		})
		
	});
	
</script>
</head>
<body>
<%
   //로그인상태확인
   String loginok=(String)session.getAttribute("loginok");

	GuestDao dao=new GuestDao();
	
	//전체갯수
	int totalCount=dao.getTotalCount();
	int perPage=3; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
	int startPage; //각블럭당 보여질 시작페이지
	int endPage; //각블럭당 보여질 끝페이지
	int currentPage;  //현재페이지
	int totalPage; //총페이지수
	int no; //각페이지당 출력할 시작번호
	
	//현재페이지 읽는데 단 null일경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총페이지수 구한다
	//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각블럭당 보여질 시작페이지
	//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
	//현재가 13일경우 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5 3페이지: 10.....
	startNum=(currentPage-1)*perPage;
	
	//각페이지당 출력할 시작번호 구하기
	//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
	no=totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<GuestDto>list=dao.getPagingList(startNum, perPage);
	
	
	/*마지막 페이지의 단 한개 남은 글을 삭제시 빈페이지가 남는다 그러므로 해결책은 그이전페이지로 가면 된다  */
	if(list.size()==0 && currentPage!=1)
	{%>
		<script type="text/javascript">
		location.href="index.jsp?main=memberguest/guestList.jsp?currentPge=<%=currentPage-1%>";
		</script>
	<%}
	
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>

<%
  if(loginok!=null){
	  %>
	  <jsp:include page="guestForm.jsp"/>
	  <hr width="700" align="left" style="margin-left: 100px;">
  <%}
%>
<div style="margin: 50px 100px;">
<b>총 <%=totalCount %>개의 방명록 글이 있습니다</b>
<br><br>
  <%
    MemberDao mdao=new MemberDao();
    for(GuestDto dto:list)
    {
    	//이름얻기
    	String name=mdao.getName(dto.getMyid());
    	%>
    	
    	<table  class="table" style="width: 600px;">
    	  <tr>
    	    <td class="d-inline-flex" style="width: 600px;">
    	    	<b style="font-size: 12pt; margin-right: 25px;"><i class="bi bi-person-circle"></i>&nbsp;&nbsp;<%=name %>&nbsp;(<%=dto.getMyid() %>)</b>
    	    
    	    <%
    	      String myid=(String)session.getAttribute("myid");
    	    
    	      //로그인한 아이디와 글을쓴아이디가 같을경우에만 수정,삭제 보이게한다
    	      if(loginok!=null && dto.getMyid().equals(myid)){
    	    	  %>
    	    	<span style="margin-left: 280px;">
    	    	  	<i class="bi bi-wrench btnup" style="color: green" onclick="location.href='index.jsp?main=memberguest/updateForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
					<!-- 수정 -->
					<i class="bi bi-x-lg btndel" style="color: red" num=<%=dto.getNum() %> currentPage=<%=currentPage %>></i>
					<!-- 삭제 -->
				</span> 
    	      <%}
    	    %>
    	    	&nbsp;&nbsp;&nbsp;
    	   		<span class="day" style="margin-top: 6px;"><%=sdf.format(dto.getWriteday()) %></span>
    	    </td>
    	  </tr>
    	  
    	  <tr height="120">
    	    <td style="font-size: 12pt;">
    	       <!-- 이미지가 null이아닌경우만 출력 -->
    	       <%
    	       if(dto.getPhotoname()!=null){%>
    	    	   
    	    	   <a href="save/<%=dto.getPhotoname()%>" target="_blank">
    	    	      <img alt="" src="save/<%=dto.getPhotoname()%>" align="left"
    	    	      style="width: 100px; " hspace="20">
    	    	   </a>
    	       <%}
    	       %>
    	       
    	       <%=dto.getContent().replace("\n", "<br>")%>
    	    </td>
    	  </tr>
    	  
    	  <!-- 댓글&추천 -->
    	  <tr>
    	    <td>
    	    <%
    	    	//각 방명록에 달린 댓글 목록 가져오기
    	    	AnswerGuestDao adao = new AnswerGuestDao();
    	    	List<AnswerGuestDto> alist = adao.getAllAnswers(dto.getNum());
    	    %>
    	    	
    	      <span class="answer" style="cursor: pointer; font-size: 12pt;">댓글 <%=alist.size()%></span>
				<span class="likes" style="margin-left: 20px; cursor: pointer;  font-size: 12pt;" num=<%=dto.getNum()%>><i class="bi bi-heart ex" style="color: red;" ></i></span>
				<span class="chu" style=" font-size: 12pt;"><%=dto.getChu() %></span>
				<i class="bi bi-heart-fill fill" style="font-size: 0px; color: red;"></i>
				
				<div class="answer">
				<%
				if(loginok!=null){
					%>
					<div class="answerform">
						<form action="memberguest/answerInsert.jsp" method="post">
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
							<input type="hidden" name="myid" value="<%=myid%>">
							<input type="hidden" name="num" value="<%=dto.getNum()%>">
							<table>
								<tr>
									<td>
										<textarea style="width: 480px; height: 70px;"
										name="content" required="required"
										class="form-control"></textarea>
									</td>
									<td>
										<button type="submit" class="btn btn-outline-info"
										style="width: 70px; height: 70px;">등록
										</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<%
				}
				%>
				<br>
					<div class="answerlist" style=" font-size: 12pt;">
						<table style="width: 500px;" class="table">
							<%
								for(AnswerGuestDto adto : alist){
									%>
									
									<tr>
										<td>
											<i class="bi bi-person-circle"></i>
											&nbsp;
											<%
												//작성자명
												String aname = mdao.getName(adto.getMyid());
											%>
											
											<b><%=aname %></b>
										&nbsp;
										<%
											//글 작성자와 댓글 작성자가 같을 경우
											if(dto.getMyid().equals(adto.getMyid())){
												%>
												<span style="color: red; font-size:10pt; border-radius: 10px; border: 1px solid red; padding: 3px;">작성자</span>
												<%
											}
										%>
										
										<span style="font-size: 9pt; color: gray; margin-left: 20px;">
											<%=sdf.format(adto.getWriteday()) %>
										</span>
										
										<!-- 댓글 수정삭제는 본인만 보이게 -->
										<%
											if(loginok!=null && adto.getMyid().equals(myid)){
												%>
												<span style="margin-top: 3px;">
													<i class="bi bi-x-lg andel" style="float: right; color: red;"  idx=<%=adto.getIdx() %> currentPage=<%=currentPage %>></i>
													
													<i class="bi bi-wrench anup" style="float: right; margin-right: 5px; color: green"
													data-bs-toggle="modal" data-bs-target="#myModal" idx="<%=adto.getIdx()%>"></i>
												</span>
												<%
											}
										%>
											<br>
											<span><%=adto.getContent().replace("\n", "<br>") %></span>
										</td>
									</tr>
									
									<%
								}
							%> 
						</table>
						
					</div>
				</div>

    	    </td>
    	  </tr>
    	</table>
    <%}
  %>
  </div>
  
  <!-- 페이지 번호 출력 -->
  <div style="width: 580px; text-align: center; margin: 50px 100px;">
  
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
	  <li class="page-item ">
	   <a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
	  </li>
  <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    		<li class="page-item active">
    		<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else
    	{%>
    		<li class="page-item">
    		<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
    	<li class="page-item">
    		<a  class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=endPage+1%>"
    		style="color: black;">다음</a>
    	</li>
    <%}
  %>
  
  </ul>
 
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
        	<input type="text" id="ucontent">&nbsp;&nbsp;&nbsp;
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