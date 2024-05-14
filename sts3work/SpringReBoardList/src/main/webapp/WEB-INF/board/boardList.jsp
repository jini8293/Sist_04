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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	div, pre{
	
	font-family: IBM Plex Sans KR;
	
	}

</style>
</head>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<table class="table table-bordered">
		<caption align="top"><b>Spring 답변형 게시판</b>
			<span style="float: right;">
				<button type="button" class="btn btn-outline-warning" onclick="location.href='writeform'">글쓰기</button>
			</span>
		</caption>
		<tr class="table-warning">
			<td width="80" align="center"><b>번호</b></td>
			<td width="300"><b>제목</b></td>
			<td width="120" align="center"><b>작성자</b></td>
			<td width="180" align="center"><b>작성일</b></td>
			<td width="80" align="center"><b>조회</b></td>
		</tr>
		<c:if test="${totalcount>0 }">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td align="center">${no }</td>
					<c:set var="no" value="${no-1 }"/>
					<td>
						<!-- relevel 만큼 공백-->
			              <c:forEach begin="1" end="${dto.relevel }">
			                &nbsp;&nbsp; 
			              </c:forEach>
			              
			              <!-- 답글인 경우에만 re이미지가 있음 -->
			              <c:if test="${dto.relevel>0 }">
			                <img alt="" src="../photo/re.png">
			              </c:if>

						<!-- 제목 -->
						<a href="content?num=${dto.num }&currentPage=${currentPage}" style="text-decoration: none;">${dto.subject }
						<c:if test="${dto.acount>0 }">
						<a style="color: red;">[${dto.acount }]</a>
						</c:if>
						</a>
						<!-- 사진이 있을 경우 아이콘 표시 -->
						<c:if test="${dto.photo!='no' }">
		                  <i class="bi bi-images photo"></i>
		                </c:if>
					</td>
					<td align="center">${dto.writer }</td>
					<td align="center"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td align="center">${dto.readcount}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<c:if test="${totalcount>0 }">

		<ul class="pagination justify-content-center">
			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a class="page-link" href="list?currentPage=${startPage-1 }" style="color: black;">이전</a>
				</li>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage==pp }">
					<li class="page-item active">
						<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${currentPage!=pp }">
					<li class="page-item">
						<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li class="page-item">
					<a class="page-link" href="list?currentPage=${endPage+1 }" style="color: black;">다음</a>
				</li>
			</c:if>
		</ul>

	</c:if>
</div>
</body>
</html>