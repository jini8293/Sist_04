<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
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
table {
	cursor: pointer;
}
</style>
</head>
<%
	UploadBoardDao dao = new UploadBoardDao();
	List<UploadBoardDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
  <div style="margin: 50px 100px; width: 1000px;">
     <button type="button" class="btn btn-info"
     onclick="location.href='addForm.jsp'">게시글추가</button>
     <button type="button" class="btn btn-dark"
     onclick="location.href='boardlist2.jsp'"><i class="bi bi-images"></i> 앨범형 목록</button>
     <button type="button" class="btn btn-warning"
     onclick="location.href='boardlist.jsp'"><i class="bi bi-list"></i> 텍스트형 목록</button><br><br>
     
     <h6 class="alert alert-info">총 <%=list.size() %>개의 게시글이 있습니다</h6>
     <br>
     <table class="table table-hover">
     	<tr align="center">
     		<th width="80">번호</th>
     		<th width="380">제목</th>
     		<th width="160">작성자</th>
     		<th width="250">작성일</th>
     		<th width="80">조회</th>
     	</tr>
     	<%
		for (int i = 0; i < list.size(); i++) {
			UploadBoardDto dto = list.get(i);
			int num = list.size() - i;
		%>
     	<tr style="font-family: IBM Plex Sans KR">
     		<td align="center"><%=num%></td>
     		<td>
     		<a href="content.jsp?num=<%=dto.getNum() %>" style="text-decoration: none; color: black;">
     		<img src="../save/<%=dto.getImgname()%>" style="width: 20px;">
     		<%=dto.getSubject()%>
     		</a>
     		</td>
     		<td align="center"><%=dto.getWriter()%></td>
     		<td align="center"><%=sdf.format(dto.getWriteday())%></td>
     		<td align="center"><%=dto.getReadcount()%></td>
     	</tr>
     	 <%
		}
		%>
     </table>
  </div>
</body>
</html>