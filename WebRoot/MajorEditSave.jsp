<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:directive.page import="testJdbc.DbManager" />
<%
	String sql = null;
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet rs = null;
	try {
		sql = "update major set majorname = '"
				+ request.getParameter("majorName") + "',depid='"
				+ request.getParameter("depId") + "' where majorid='"
				+ request.getParameter("majorID") + "'";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		rs = preStmt.executeQuery();
		if (preStmt.executeUpdate(sql) > 0) {
			response.sendRedirect("majorList.jsp");
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>
