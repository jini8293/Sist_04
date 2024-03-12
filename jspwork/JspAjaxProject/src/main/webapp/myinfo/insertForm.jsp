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
<script type="text/javascript">
	function goFocus(hp) {
		if(hp.value.length==4){
			frm.hp3.focus();
		}
	}
</script>

<style type="text/css">
div.insertform th,b,td{
	font-family: Black Han Sans;
	 font-weight: lighter;
	font-size: 15pt;
}
</style>
</head>
<body>
	<div style="margin: 100px 100px; width: 500px;" class="insertform">
		<form action="insertAction.jsp" method="post" name="frm">
			<table class="table table-bordered">
				<caption align="top"><b>[ 개인신상정보 ]</b></caption>
				<tr>
					<th width="100" class="table-success" style=" text-align: center;" valign="middle">이름</th>
					<td>
						<input type="text" name="name" class="form-control"
						style="width: 120px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-success"  style=" text-align: center;" valign="middle">혈액형</th>
					<td>
						<select name="blood" class="form-control" style="width: 100px;">
							<option value="A">A형</option>
							<option value="B">B형</option>
							<option value="O">O형</option>
							<option value="AB">AB형</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-success"  style=" text-align: center;" valign="middle">연락처</th>
					<td class="d-inline-flex">
						<select name="hp1" class="form-control" style="width: 114px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</select>
						&nbsp;&nbsp;
						<b>-</b>
						&nbsp;&nbsp;
						<input type="text" name="hp2" class="form-control" 
						required="required" style="width: 106px;" onkeyup="goFocus(this)">
						&nbsp;&nbsp;
						<b>-</b>
						&nbsp;&nbsp;
						<input type="text" name="hp3" class="form-control" 
						required="required" style="width: 108px;">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-success"  style=" text-align: center;" valign="middle">생년월일</th>
					<td>
						<input type="date" name="birth" class="form-control"
						style="width: 150px;" required="required" value="2000-01-01">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장" class="btn btn-success">
						<input type="button" value="목록" class="btn btn-dark" onclick="location.href='infoList.jsp'">
					</td>
				</tr>					
				
			</table>
		</form>
	</div>
</body>
</html>