<%@page import="simpleboardanswer.model.SimpleAnswerDao"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
div.div1{
	font-family:IBM Plex Sans KR; 
}

a:link,a:visited{
	text-decoration: none;
	color: black;
}

a:hover{
	text-decoration:underline;
	color: gray;
}
</style>
</head>
<%
	SimpleBoardDao dao = new SimpleBoardDao();

	//전체 갯수
	int totalCount = dao.getTotalCount();
	
	int perPage = 3;//한페이지당 보여질 글의 갯수
	int perBlock=5;//한블럭당 보여질 페이지 갯수
	int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	int startPage;//각 블럭당 보여질 시작페이지
	int endPage; //각 블럭당 보여질 끝페이지
	int currentPage;//현재페이지
	int totalPage;//총 페이지수
	int no;//각페이지당 출력할 시작번호
	
	//현재 페이지 읽는데 단 null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null){
		currentPage=1;
	}else{
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//총페이지수 구한다
	//총글갯수/한페이지당 보여질 갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2 페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각블럭당 보여질 시작페이지
	//perBlock=5일 경우 현재 페이지가 1~5일 경우 시작페이지가 1, 끝페이지가 5
	//현재가 13일 경우 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage = startPage+perBlock-1;
	
	//총페이지가 23일 경우 마지막 블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage){
		endPage=totalPage;
	}
	
	//각페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5, 3페이지:10
	startNum=(currentPage-1)*perPage;

	//각페이지당 출력할 시작번호 구하기
	//총글 개수가 23, 1페이지:23, 2페이지:18, 3페이지:13
	no = totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<SimpleBoardDto> list = dao.getPagingList(startNum, perPage);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//int count = list.size();
	
	//list의 각 dto에 댓글 개수 저장해두기
	SimpleAnswerDao adao = new SimpleAnswerDao();
	
	for(SimpleBoardDto dto:list){
		//댓글 변수에 댓글 총개수 넣기
		int answercount=adao.getAllDatas(dto.getNum()).size();
		dto.setAnswercount(answercount);
		
	}
%>
<body>
	<div style="margin: 50px 100px; width: 800px;" class="div1">
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href='addForm.jsp'" style="margin-left: 705px;">
			<i class="bi bi-pencil"></i>  글쓰기</button>
		<br>
		<h6><b>총 <%=totalCount %>개의 글이 있습니다</b></h6>
		<table class="table table-bordered">
				<caption align="top"><b>간단 목록 게시판</b></caption>
			<tr align="center" class="table-dark">
				<th width="80">번호</th>
				<th width="380">제목</th>
				<th width="160">작성자</th>
				<th width="250">작성일</th>
				<th width="80">조회</th>
			</tr>
			
			<%
				if(totalCount==0){
					%>
					<tr>
						<td colspan="5" align="center">
							<h6><b>등록된 게시글이 없습니다</b></h6>
						</td>
					</tr>
					<%
				}else{
					for(int i=0;i<list.size();i++){
						SimpleBoardDto dto = list.get(i);
						%>
						<tr>
							<td align="center"><%=no-i %></td>
							<td><a href="contentView.jsp?num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
							<!-- 댓글 개수 -->
							<%
							if(dto.getAnswercount()>0){
								%>
								<a style="color: red;" href="contentView.jsp?num=<%=dto.getNum() %>#alist">[<%=dto.getAnswercount() %>]</a>
								<%
							}
							%>
							</td>
							<td align="center"><%=dto.getWriter() %></td>
							<td align="center"><%=sdf.format(dto.getWriteday())%></td>
     						<td align="center"><%=dto.getReadcount()%></td>
						</tr>
						<%
					}
				}
			%>
		</table>
		
		<!-- 페이지 번호 출력 -->

		<ul class="pagination justify-content-center">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="boardList.jsp?currentPage=<%=startPage - 1%>"
				style="color: black">이전</a></li>

			<%
			}
			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>


			<%
			}
			}
			if (endPage < totalPage) {
			%>
			<li class="page-item"><a class="page-link"
				href="boardList.jsp?currentPage=<%=endPage + 1%>"
				style="color: black">다음</a></li>
			<%
			}
			%>
		</ul>
	</div>

</body>
</html>