<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<div style="margin: 30px 50px; width: 800px;" class="div1">
		
		<c:forEach var="dto" items="${list }">
		<table class="table table-bordered" >
			<tr>
				<td width="350" rowspan="7" valign="middle" align="center">
					<img src="../memberimage/${dto.photo }" id="mainimg" width="250" style="border-radius: 200px;">
				</td>
				<td valign="middle">
					NAME | ${dto.name}
				</td>
				<td rowspan="7" style="width: 150px;" align="center" valign="middle">
					<button class="btn btn-outline-dark" type="button" onclick="location.href='index.jsp?main=member/updatepassForm.jsp?num='">수정</button><br><br>
					<button class="btn btn-outline-danger" type="button" onclick="funcdel()">탈퇴</button>
				</td>
			</tr>
			<tr>
				<td valign="middle" >
					ID | ${dto.id}
				</td>
			</tr>
			<tr>
				<td valign="middle">
					PASS | ${dto.pass}
				</td>
			</tr>
			<tr>
				<td valign="middle">
					H.P | ${dto.hp}
				</td>
			</tr>
			<tr>
				<td valign="middle">
					ADDR | ${dto.addr}
				</td>
			</tr>
			<tr>
				<td valign="middle">
					EMAIL | ${dto.email}
				</td>
			</tr>
			<tr>
				<td valign="middle">
					SINGED DAY | <fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			</table>
		<br>
	</c:forEach>
	</div>
	<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content ">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="delnum">
      	<input type="hidden" id="delnum">
       <b>비밀번호를 입력해 주세요</b>
       <input type="password" id="delpass" class="form-control" style="width: 120px;" placeholder="passward">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">삭제</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>