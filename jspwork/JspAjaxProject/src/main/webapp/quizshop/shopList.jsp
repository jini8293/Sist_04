<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="quizshop.model.QuizShopDto"%>
<%@page import="quizshop.model.QuizShopDao"%>
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
.detail{
	cursor: pointer;
}
</style>
</head>

<%
QuizShopDao dao = new QuizShopDao();
List<QuizShopDto> list = dao.getAllInfo();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<body>
   <div style="margin: 50px 50px; width: 800px;">
      <h3 class="alert alert-info">QuizShop 입고목록</h3>
      <br>
      <button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">상품추가</button>
      <br>
      <table class="table table-bordered">
         <tr class="table-info">
            <th width="60">번호</th>
            <th width="200">상품명</th>
            <th width="180">가격</th>
            <th width="160">입고일</th>
            <th width="160">등록일</th>            
         </tr>
         <tr>
          <%
		 	for(int i=0;i<list.size();i++){
		 		QuizShopDto dto = list.get(i);
		 		%>
		 			<td align="center"><%=i+1 %></td>
		 			<td class="detail" onclick="location.href='detailForm.jsp?num=<%=dto.getNum() %>'"><%=dto.getSang_name() %></td>
		 			<td><%=dto.getPrice() %>원</td>
		 			<td><%=dto.getIpgoday() %></td>
		 			<td><%=sdf.format(dto.getWriteday()) %></td>
		 		</tr>
		 		<% 
		 	}
		 %>
      </table>
   </div>
</body>

</html>