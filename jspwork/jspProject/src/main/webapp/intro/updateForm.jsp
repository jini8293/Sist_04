<%@page import="intro.model.IntroDto"%>
<%@page import="intro.model.IntroDao"%>
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
</head>
<%
String num = request.getParameter("num");
IntroDao dao = new IntroDao();
IntroDto dto = dao.getData(num);
%>
<script type="text/javascript">
function funcdel(num) {
	var yes = confirm("정말 삭제하시겠습니까?");
	if(yes){
		location.href='deleteAction.jsp?num='+num;
	}
}

function funcup(num) {
	var yes = confirm("수정하시겠습니까?");
	if(yes){
		location.href='updateAction.jsp?num='+num;
	}
}
</script>
<body>
	<div style="margin: 30px 50px;">
		<form action="updateAction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top">
					<b><%=dto.getName()%>님의 자기소개</b>
				</caption>
				<tr>
					<th align="center" valign="middle">이름</th>
					<td><input type="text" name="name" class="form-control"
						required="required" style="width: 120px;" value="<%=dto.getName()%>"></td>
				</tr>

				<tr>
					<th align="center" valign="middle">나이</th>
					<td><input type="number" name="age" class="form-control"
						style="width: 80px;" value="<%=dto.getAge()%>"></td>
				</tr>

				<tr>
					<th align="center" valign="middle">생년월일</th>
					<td><input type="date" name="birthday" class="form-control"
						style="width: 200px;" value="<%=dto.getBirthday()%>"></td>
				</tr>

				<tr>
					<th>거주지역</th>
					<td >
						<label><input type="radio" name="hometown" value="서울" checked="checked" <%=dto.getHometown().equals("서울")?"checked":""%>>서울</label> 
						<label><input type="radio" name="hometown" value="경기" <%=dto.getHometown().equals("경기")?"checked":""%>>경기</label> 
						<label><input type="radio" name="hometown" value="인천" <%=dto.getHometown().equals("인천")?"checked":""%>>인천</label> 
						<label><input type="radio" name="hometown" value="대구" <%=dto.getHometown().equals("대구")?"checked":""%>>대구</label>
						<label><input type="radio" name="hometown" value="대전" <%=dto.getHometown().equals("대전")?"checked":""%>>대전</label>
						<label><input type="radio" name="hometown" value="제주" <%=dto.getHometown().equals("제주")?"checked":""%>>제주</label>
					</td>
				</tr>
				
				<tr>
					<th>취미</th>
					<td >
						<label><input type="checkbox" name="hobby" value="게임" <%=dto.getHobby().contains("게임")?"checked":""%>>게임</label> 
						<label><input type="checkbox" name="hobby" value="넷플릭스" <%=dto.getHobby().contains("넷플릭스")?"checked":""%>>넷플릭스</label> 
						<label><input type="checkbox" name="hobby" value="독서" <%=dto.getHobby().contains("독서")?"checked":""%>>독서</label> 
						<label><input type="checkbox" name="hobby" value="여행" <%=dto.getHobby().contains("여행")?"checked":""%>>여행</label>
						<label><input type="checkbox" name="hobby" value="공부" <%=dto.getHobby().contains("공부")?"checked":""%>>공부</label>
						<label><input type="checkbox" name="hobby" value="코딩" <%=dto.getHobby().contains("코딩")?"checked":""%>>코딩</label>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
					<textarea style="width: 500px; height: 100px"
					class="form-control" name="memo" ><%=dto.getMemo()%></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='introList.jsp'">목록</button>
						<button type="submit" class="btn btn-outline-success" onclick="funcup(<%=dto.getNum()%>)">수정</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="funcdel(<%=dto.getNum()%>)">삭제</button>
					</td>
				</tr>


			</table>

		</form>
	</div>

</body>
</html>