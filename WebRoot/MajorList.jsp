<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="testJdbc.DbManager" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
	<%
		if (session.getAttribute("username") == null
				|| session.getAttribute("username").equals("")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<p align="center">
		<strong><font size="4" color="#FF0000"">专业资料列表</font>
		</strong>
	</p>
	<div class="list">
		<table>
			<tr>
			<th>
	  				  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method=post>
	  				  	
	  				  	全选/反选<br /><input type="checkbox" id="checkall" name="checkall" onclick="checkAll(checkall)" /><br />
	  				  	  	   <input type="submit" value="删除"  onclick="return confirm('确定删除选择项？')" align="left">
	  				  	</form>
	  				  </th>
				<th>专业编号</th>
				<th>专业名称</th>
				<th>所属学院</th>
				<th>修改资料</th>
				<th>删除资料</th>
			</tr>
			<%
				String sql = null;
				Connection conn = null;
				PreparedStatement preStmt = null;
				ResultSet rs = null;
				try {
					sql = "select m.majorid,m.majorname,d.depname from major m left outer join department d on m.depid=d.depid";
					conn = DbManager.getConnection();
					preStmt = conn.prepareStatement(sql);
					rs = preStmt.executeQuery();
					String majorId = "", majorName = "", depname = "";
					while (rs.next()) {
						majorId = rs.getString("majorid");
						majorName = rs.getString("majorname");
						depname = rs.getString("depname");
			%>


			<tr>
			<td align ="center"><input type="checkbox"  name="info" value= " +id+ " /></td>
				<td><%=majorId%></td>
				<td><%=majorName%></td>
				<td><%=depname%></td>
				<td><a href="MajorEdit.jsp?majorId=<%=majorId%>">修改资料</a>
				</td>
				<td><a href="majorDel.jsp?majorId=<%=majorId%>"
					onclick="return check();">删除资料</a>
				</td>
			</tr>
			<%
				}
				} finally {
					if (rs != null)
						rs.close();
					if (preStmt != null)
						preStmt.close();
					if (conn != null)
						conn.close();
				}
			%>
		</table>
	</div>
	<div class="add">
		<a href="MajorAdd.jsp">新增专业</a>
	</div>
	<br />
	<jsp:include flush="true" page="bottom.jsp" />
</body>
</html>
<script language="javascript">
	function check() {
		if (confirm("删除确认")) {
			return true;
		}
		return false;
	}
</script>
