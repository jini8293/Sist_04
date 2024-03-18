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
    .div1{
        border: 1px solid lightgray;
        font-family: IBM Plex Sans KR;
        border-radius: 10px;
    }

    .div2{
        margin: 50px 30px;
        font-family: IBM Plex Sans KR;
    }

    .div3{
        display: flex;
        flex-wrap: wrap;
    }
    
    dl dt{
    cursor: pointer;
    }

    .div4{
        margin: 50px 100px;
        font-family: IBM Plex Sans KR;
    }
    .image-container {
        margin-bottom: 20px;

    }
    .image-container img {
        border: 1px solid lightgray;
        width: 250px;
        height: 250px;
        margin: 0 auto;
    }
    .image-container dl {
        margin-top: 10px;
    }
</style>
</head>
<%
UploadBoardDao dao = new UploadBoardDao();
List<UploadBoardDto> list = dao.getAllDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
    <form action="addForm.jsp" method="post" style="margin: 50px 100px; width: 1200px;">
    <button type="button" class="btn btn-info"
     onclick="location.href='addForm.jsp'">게시글추가</button>
     <button type="button" class="btn btn-dark"
     onclick="location.href='boardlist2.jsp'"><i class="bi bi-images"></i> 앨범형 목록</button>
     <button type="button" class="btn btn-warning"
     onclick="location.href='boardlist.jsp'"><i class="bi bi-list"></i> 텍스트형 목록</button><br><br>
    <div  class="div1">
        <div class="div2">
            <h3>전체글 보기</h3>
            <b><%=list.size() %>개의 글</b>
            <hr>
            <div class="div3">
                <% 
                for (int i = 0; i < list.size(); i++) {
                    UploadBoardDto dto = list.get(i);
                %>
                    <div class="image-container" style="margin-left: 25px;">
                        <a href="content.jsp?num=<%=dto.getNum() %>" style="text-decoration: none;">
                            <img src="../save/<%=dto.getImgname() %>">
                        </a>
                        <dl>
                            <dt onclick="location.href='content.jsp?num=<%=dto.getNum() %>'"><%=dto.getSubject() %></dt>
                            <dd><%=dto.getContent() %></dd>
                            <p><%=sdf.format(dto.getWriteday()) %>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                            조회  &nbsp;  <%=dto.getReadcount() %></p>
                        </dl>
                    </div>
                    <% if ((i + 1) % 4 == 0) { %> 
                        <br>
                    <% } %>
                <% } %>
            </div>
        </div>
    </div>
    </form>
</body>
</html>