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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body>
<div style="margin: 100px 100px; width: 600px;">

	<table class="table table-bordered">
		<caption align="top"><b>내용보기</b></caption>
		<tr>
			<td>
				<b style="font-size: 1.5em;">${dto.subject }</b>
				<span style="color: gray; float: right;">
					${dto.writeday }
				</span>
			</td>
		</tr>		
		<tr>
			<td>
				<b>${dto.writer }</b>
				<span style="float: right;">조회 | ${dto.readcount }</span>
				<div>
				 	<c:if test="${dto.photo!='no' }">
				 		<c:forTokens var="f" items="${dto.photo }" delims=",">
				 			<div>
				 				<a href="download?clip=${f }" style="text-decoration: none;">
				 					<i class="bi bi-download"></i>&nbsp;
				 					<span>${f }</span>
				 				</a>
				 			</div>
				 		</c:forTokens>
				 	</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<pre>${dto.content }</pre>
				<br>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
						<img alt="" src="../photo/${im }" style="width: 200px;" class="img-thumbnail">&nbsp;&nbsp;
					</c:forTokens>
				</c:if> 
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="button" class="btn btn-outline-warning" onclick="location.href='addForm'">글쓰기</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
				<button type="button" class="btn btn-success" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>