<%@page import="java.io.File"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
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
<title>Insert title here</title>
</head>
<body>
	<%
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");

	UploadBoardDao dao = new UploadBoardDao();
	
	boolean b = dao.isEqualPass(num, pass);

	if (b) {
		
		//게시글 지우기전 업로드된 이미지 지우기
		String imgName = dao.getData(num).getImgname();
		
		//업로드경로
		String uPath = getServletContext().getRealPath("/save");
		
		//파일생성
		File file = new File(uPath+"\\"+imgName);
		
		//파일 삭제
		if(file.exists()){ //파일이 존재하면
			file.delete(); //파일을 삭제
		}
		
		dao.uboardDelete(num); 
		%>
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<%
		response.sendRedirect("boardlist.jsp");
	
	} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.back();
	</script>
	<%
	}
	%>


</body>
</html>