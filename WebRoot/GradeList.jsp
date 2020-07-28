<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="testJdbc.Pagination" />
<jsp:directive.page import="testJdbc.DbManager" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%
		if (session.getAttribute("username") == null
				|| session.getAttribute("username").equals("")) {
			response.sendRedirect("index.jsp");
		}
		final int pageSize = 8; // 一页显示 10 条记录
		int pageNum = 1; // 当前页数
		int pageCount = 1; // 总页数
		int recordCount = 0; // 总记录数
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<p class="measureList">学生成绩列表</p>
	<div class="list">
		<table>
			<tr>
				<th>
					<form action="<%=request.getContextPath()%>/UserDeleteServlet"
						method=post>

						全选/反选<br />
						<input type="checkbox" id="checkall" name="checkall"
							onclick="checkAll(checkall)" /><br /> <input type="submit"
							value="删除" onclick="return confirm('确定删除选择项？')" align="left">
					</form></th>
				<th>成绩编号</th>
				<th>学生学号</th>
				<th>学生姓名</th>
				<th>课程名称</th>
				<th>课程分数</th>
				<th>修改资料</th>
				<th>删除资料</th>
			</tr>
			<%
				try {
					// 从地址栏参数取当前页数
					pageNum = Integer.parseInt(request.getParameter("pageNum"));
				} catch (Exception e) {
				}

				String sql = null;

				Connection conn = null;
				PreparedStatement preStmt = null;
				ResultSet rs = null;
				try {
					// 从地址栏参数取当前页数
					pageNum = Integer.parseInt(request.getParameter("pageNum"));
				} catch (Exception e) {
				}

				try {
					sql = "SELECT count(*) from grade g left outer join students s on g.studid=s.studid left outer join course c on g.courseid=c.courseid";

					recordCount = DbManager.getCount(sql);

					// 计算总页数
					pageCount = (recordCount + pageSize - 1) / pageSize;
					// 本页从 startRecord 行开始
					int startRecord = (pageNum - 1) * pageSize;

					// MySQL 使用limit实现分页
					sql = "select g.*,s.StudName,c.coursename from grade g left outer join students s on g.studid=s.studid left outer join course c on g.courseid=c.courseid LIMIT ?, ? ";

					conn = DbManager.getConnection();
					preStmt = conn.prepareStatement(sql);
					DbManager.setParams(preStmt, startRecord, pageSize);
					rs = preStmt.executeQuery();
					String gradeid = "", studId = "", studName = "", coursename = "", gradeNum = "";
					while (rs.next()) {
						gradeid = rs.getString("gradeid");
						studId = rs.getString("StudID");
						studName = rs.getString("StudName");
						coursename = rs.getString("coursename");
						gradeNum = rs.getString("gradeNum");
			%>
			<tr>
				<td align="center"><input type="checkbox" name="info"
					value=" +id+ " />
				</td>
				<td><%=gradeid%></td>
				<td><%=studId%></td>
				<td><%=studName%></td>
				<td><%=coursename%></td>
				<td><%=gradeNum%></td>
				<td><a href="StudEdit.jsp?studId=<%=studId%>">修改成绩</a></td>
				<td><a href="StudDel.jsp?studId=<%=studId%>"
					onclick="return check();">删除成绩</a></td>
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
		<a href="StudAdd.jsp">新增成绩</a>
		<a href="test.jsp">成绩查询</a>
		<a href="Grade.jsp">成绩统计</a>
	</div>
		<table align=right>
		<tr>
			<td><%=Pagination.getPagination(pageNum, pageCount, recordCount, request.getRequestURI())%>
			</td>
		</tr>
	</table>
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
