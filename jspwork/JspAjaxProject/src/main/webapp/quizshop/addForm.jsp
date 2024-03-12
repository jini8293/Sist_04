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
<script type="text/javascript">

	$(function() {
		
		//포토 이미지 선택시 옆에 이미지 나오게
		$("#photo").change(function() {
			var s = "../image/쇼핑몰이미지/"+$(this).val()+".jpg";
			
			$("#myphoto").attr("src",s);
		})
	})

</script>
<body>
	<div style="margin: 50px 100px; width: 500px">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered">
		 		<caption align="top"><b>상품 등록</b></caption>
		 		<tr>
					<th width="100" class="table-dark" style=" text-align: center;" valign="middle">상품명</th>
					<td>
						<input type="text" name="sang_name" class="form-control"
						style="width: 150px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style=" text-align: center;" valign="middle">이미지</th>
					<td>
					<div class="d-inline-flex">
						<select name="photo" id="photo" class="form-control" style="width: 150px;">
							<option value="1">판쵸외투</option>
							<option value="2">가디건</option>
							<option value="25">원피스</option>
							<option value="34">반바지</option>
							<option value="16">스웨이드단화</option>
							<option value="24">이지팬츠</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="" width="30" id="myphoto">
						</div>
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style=" text-align: center;" valign="middle">가격</th>
					<td>
						<input type="text" name="price" class="form-control"
						style="width: 150px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style=" text-align: center;" valign="middle">입고일</th>
					<td>
						<input type="date" name="ipgoday" class="form-control"
						style="width: 150px;" required="required" value="2024-03-12">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-danger">상품등록</button>
						<button type="button" class="btn btn-outline-dark"
						onclick="location.href='shopList.jsp'">상품목록</button>
					</td>
				</tr>
		 		
			</table>
		</form>
	</div>
</body>
</html>