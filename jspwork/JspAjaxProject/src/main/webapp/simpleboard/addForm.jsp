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
   div{
   	text-align: center;
   	font-family: IBM Plex Sans KR;
   }
</style>
</head>
<body>
<div style="margin: 50px 100px; width: 500px;">
    <form action="addAction.jsp" method="post">
      <table class="table table-bordered">
      	<caption align="top"><b>[ SIMPLEBOARD 글쓰기 ]</b></caption>
         <tr>
           <th width="100" class="table-dark" valign="middle">작성자</th>
           <td>
             <input type="text" name="writer" class="form-control"
             style="width: 120px;" required="required">
           </td>
         </tr>
         
         <tr>
           <th width="100" class="table-dark" valign="middle">제목</th>
           <td>
             <input type="text" name="subject" class="form-control"
             style="width: 300px;" required="required">
           </td>
         </tr>
         
         <tr>
           <th width="100" class="table-dark" valign="middle">비밀번호</th>
           <td>
             <input type="text" name="pass" class="form-control"
             style="width: 200px;" required="required" >
           </td>
         </tr>
         
         <tr>
           <td colspan="2">
             <textarea style="width: 480px; height: 100px;"
             class="form-control" name="content" required="required"></textarea>
           </td>
         </tr>
         
         <tr>
           <td colspan="2" align="center">
             <button type="submit" style="width: 100px;"
             class="btn btn-success btn-md">저장하기</button>
             <button type="button" style="width: 100px;"
             class="btn btn-outline-dark btn-md"
             onclick="location.href='boardList.jsp'">목록보기</button>
           </td>
         </tr>
      </table>
    
    </form>
    
</div>
</body>
</html>