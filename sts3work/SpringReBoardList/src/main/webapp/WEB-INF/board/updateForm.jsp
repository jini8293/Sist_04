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
   <form action="update" method="post" enctype="multipart/form-data">
   <input type="hidden" value="${currentPage }" name="currentPage">
   <input type="hidden" value="${dto.num }" name="num">
     <table class="table table-bordered">
        <caption align="top"><b>
        	수정하기
        </b></caption>
        <tr>
          <th class="table-warning" style="width: 100px; text-align: center;" valign="middle" >작성자</th>
          <td>
            <input type="text" name="writer" required="required"
            style="width: 130px;" class="form-control" value="${dto.writer }">
          </td>
        </tr>
        <tr>
          <th class="table-warning" style="width: 100px; text-align: center;" valign="middle" >제목</th>
          <td>
            <input type="text" name="subject" required="required"
            style="width: 400px;" class="form-control" value="${dto.subject }">
          </td>
        </tr>
        
        <tr>
          <th class="table-warning" style="width: 100px; text-align: center;" valign="middle" >사진</th>
          <td>
          	<p style="color: red;">※ 사진은 수정이 필요한 경우에만 선택해 주세요</p>
            <input type="file" name="upload" 
            style="width: 300px;" class="form-control"
            multiple="multiple">
          </td>
        </tr>
        
        <tr>
          <td colspan="2">
            <textarea style="width: 500px; height: 150px;" required="required"
            name="content" class="form-control">${dto.content }</textarea>
          </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <button type="submit" class="btn btn-success" style="width: 120px;">수정</button>
            <button type="button" class="btn btn-success"
            onclick="history.back()" style="width: 120px;">이전</button>
          </td>
        </tr>
     </table>
   </form>
</div>
</body>
</html>