<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:directive.page import="testJdbc.DbManager" />
<%
	String sql = null;
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet rs = null;
	try {
		sql = "delete major where majorid='"
				+ request.getParameter("majorId") + "'";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		rs = preStmt.executeQuery();
		response.sendRedirect("majorList.jsp");
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>
