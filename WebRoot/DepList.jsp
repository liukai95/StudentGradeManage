<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
	<%
		if (session.getAttribute("username") == null
				|| session.getAttribute("username").equals("")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<p class="measureList">学院资料列表</p>

	<div class="list">
		<table>
			<tr>
				<th>学院编号</th>
				<th>学院名称</th>
				<th>修改资料</th>
				<th>删除资料</th>
			</tr>
			<%
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/stuinfo";
				String userID = "root", pwd = "123456", sql = "";
				try {
					Class.forName(driver);
					Connection conn = DriverManager.getConnection(url, userID, pwd);//建立与数据的连接
					sql = "select * from department";
					Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
					ResultSet rs = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
					String depid = "";
					while (rs.next()) {
						depid = rs.getString("DepID");
			%>
			<tr>
				<td><%=depid%></td>
				<td><%=rs.getString("DepName")%></td>
				<td><a href="DepEdit.jsp?DepID=<%=depid%>">修改资料</a>
				</td>
				<td><a href="DepDel.jsp?DepID=<%=depid%>"
					onclick="return check();">删除资料</a>
				</td>
			</tr>
			<%
				}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			%>
		</table>
	</div>
	<br />
	<div class="add">
		<a href="DepAdd.jsp">新增学院</a>
	</div>
	
	<br />
	<jsp:include flush="true" page="bottom.jsp" />
</body>
</html>
<script type="text/javascript">
	function check() {
		if (confirm("删除确认")) {
			return true;
		}
		return false;
	}
</script>
