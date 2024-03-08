<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DbConnect db = new DbConnect();
Connection conn = db.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from food order by num";

String s = "[";
try {
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		String num = rs.getString("num");
		String foodname = rs.getString("foodname");
		String foodphoto = rs.getString("foodphoto");
		String price = rs.getString("price");
		String cnt = rs.getString("cnt");

		s += "{";
		s += "\"num\":" + num + ",\"foodname\":\"" + foodname + "\",\"foodphoto\":\"" + foodphoto;
		s += "\",\"price\":" + price + ",\"cnt\":\"" + cnt + "\"";
		s += "},";

	}

	s = s.substring(0, s.length() - 1);
} catch (SQLException e) {
} finally {
	db.dbClose(rs, pstmt, conn);
}
s += "]";
%>

<%=s%>



