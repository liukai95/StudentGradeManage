<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:directive.page import="testJdbc.DbManager" />
<%
	String sql = null;
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet rs = null;
	try {
		request.setCharacterEncoding("utf-8"); //乱码转换成中文
		sql = "select * from major where majorid='"
				+ request.getParameter("majorID") + "'";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		rs = preStmt.executeQuery();
		Statement stmt = conn.createStatement(); //建立Statement的实例，相当于创建一个查询分析器的运行环境

		if (rs.next()) {
%>
<script type="text/javascript">
	alert("专业编号已存在，请选择其它编号");
	window.history.go(-1);
</script>
<%
	}
		rs.close();
		sql = "insert major values('" + request.getParameter("majorID")
				+ "','" + request.getParameter("majorName") + "','"
				+ request.getParameter("depID") + "')";
		if (stmt.executeUpdate(sql) > 0) {
			response.sendRedirect("MajorList.jsp");
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>
