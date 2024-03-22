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
<title>Insert title here</title>
<style type="text/css">
.div2 {
	border: 1px solid lightgray;

	width: 700px;
	height: 200px;
}

.div3 {
	margin-top: 15px;
}

.div4 {

}
</style>
</head>
<body>
	<%
	String root = request.getContextPath();
	//로그인 상태 확인
	String loginok = (String) session.getAttribute("loginok");

	GuestDao dao = new GuestDao();
	//전체 갯수
	int totalCount = dao.getTotalCount();

	int perPage = 3;//한페이지당 보여질 글의 갯수
	int perBlock = 5;//한블럭당 보여질 페이지 갯수
	int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	int startPage;//각 블럭당 보여질 시작페이지
	int endPage; //각 블럭당 보여질 끝페이지
	int currentPage;//현재페이지
	int totalPage;//총 페이지수
	int no;//각페이지당 출력할 시작번호

	//현재 페이지 읽는데 단 null일 경우는 1페이지로 준다
	if (request.getParameter("currentPage") == null) {
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	//총페이지수 구한다
	//총글갯수/한페이지당 보여질 갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2 페이지가 필요)
	totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	//각블럭당 보여질 시작페이지
	//perBlock=5일 경우 현재 페이지가 1~5일 경우 시작페이지가 1, 끝페이지가 5
	//현재가 13일 경우 시작:11 끝:15
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;

	//총페이지가 23일 경우 마지막 블럭은 끝페이지가 25가 아니라 23
	if (endPage > totalPage) {
		endPage = totalPage;
	}

	//각페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5, 3페이지:10
	startNum = (currentPage - 1) * perPage;

	//각페이지당 출력할 시작번호 구하기
	//총글 개수가 23, 1페이지:23, 2페이지:18, 3페이지:13
	no = totalCount - (currentPage - 1) * perPage;

	//페이지에서 보여질 글만 가져오기
	List<GuestDto> list = dao.getPagingList(startNum, perPage);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	//int count = list.size();
	MemberDao mdao = new MemberDao();

	%>
	<%
	if (loginok != null) {
	%>
	<jsp:include page="guestForm.jsp" />
	<hr width="700" align="left" style="margin-left: 100px;">
	<%
	}
	%>
	<div style="margin: 50px 100px; width: 800px;" class="div1">
		<h6>
			<b>총 <%=totalCount%>개의 글이 있습니다
			</b>
		</h6>

		<%
		if (totalCount == 0) {
		%>
		<div>
			<h6>
				<b>등록된 게시글이 없습니다</b>
			</h6>
		</div>
		<%
		} else {
		for (int i = 0; i < list.size(); i++) {
			GuestDto dto = list.get(i);
			String name = mdao.getName(dto.getMyid());
		%>
		
		<br>
		<div class="div2">
		<div class="icon-buttons" style=" float: right;">
			<i class="bi bi-wrench" style="color: green"></i>
			<!-- 수정 -->
			<i class="bi bi-x-lg" style="color: red"></i>
			<!-- 삭제 -->
		</div>
		<br>
			<div class="div3">
				<b style="margin-left: 20px; margin-top: 5px;"><%=name%> (<%=dto.getMyid()%>)</b>
				<span
					style="float: right; margin-right: 15px; font-size: 12pt; color: gray"><%=sdf.format(dto.getWriteday())%></span>
			</div>
			<hr>
			<div class="div4">

				<span style="width: 550px; float: left; margin-left: 20px;"><pre style="font-family: IBM Plex Sans KR;"><%=dto.getContent()%></pre></span>
				<%
				if (dto.getPhotoname() != null) {
				%>
				<img
					src="save/<%=dto.getPhotoname()%>" width="50">
				<%
				} else {
				%>
				<span style="margin-left: 10px;"><h6>
						이미지<i class="bi bi-x"></i>
					</h6></span>
				<%
				}
				%>
			</div>
		</div>

		<%
		}
		}
		%>

		<!-- 페이지 번호 출력 -->
	<br>
		<ul class="pagination justify-content-center" style="margin-right: 100px;">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="<%=root%>/index.jsp?main=memberguest/guestList.jsp?currentPage=<%=startPage - 1%>"
				style="color: black">이전</a></li>

			<%
			}
			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="<%=root%>/index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="<%=root%>/index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>


			<%
			}
			}
			if (endPage < totalPage) {
			%>
			<li class="page-item"><a class="page-link"
				href="<%=root%>/index.jsp?main=memberguest/guestList.jsp?currentPage=<%=endPage + 1%>"
				style="color: black">다음</a></li>
			<%
			}
			%>
		</ul>
	</div>
	<br>
</body>
</html>