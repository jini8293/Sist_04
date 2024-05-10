<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
   <form action="insert" method="post" enctype="multipart/form-data">
   <input type="hidden" value="${currentPage }" name="currentPage">
     <table class="table table-bordered">
        <caption align="top"><b>글쓰기</b></caption>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="writer" required="required"
            style="width: 130px;" class="form-control">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="subject" required="required"
            style="width: 300px;" class="form-control">
          </td>
        </tr>
        
        <tr>
          <th>사진</th>
          <td>
            <input type="file" name="upload" 
            style="width: 250px;" class="form-control"
            multiple="multiple">
          </td>
        </tr>
        
        <tr>
          <th>내용</th>
          <td>
            <textarea style="width: 400px; height: 150px;" required="required"
            name="content" class="form-control"></textarea>
          </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <button type="submit" class="btn btn-success" style="width: 120px;">글저장</button>
            <button type="button" class="btn btn-success"
            onclick="history.back()" style="width: 120px;">이전</button>
          </td>
        </tr>
     </table>
   </form>
</div>
</body>
</html>