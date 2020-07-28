<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<jsp:directive.page import="testJdbc.Pagination" />
<jsp:directive.page import="myBean.Class" />
<jsp:directive.page import="myDAO.ClassDAO" />
<jsp:directive.page import="java.util.List" />
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
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<br />
	<%
		final int pageSize = 8; // 一页显示 8条记录
			int pageNum = 1; // 当前页数
			int pageCount = 1; // 总页数
			int recordCount = 0; // 总记录数	
		try {
		// 从地址栏参数取当前页数
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
			} catch (Exception e) {
			}
			try {
		recordCount =ClassDAO.total();
		// 计算总页数
		pageCount = (recordCount + pageSize - 1) / pageSize;
		// 本页从 startRecord 行开始
		int startRecord = (pageNum - 1) * pageSize;
		 List<Class> listClass=ClassDAO.listClass2(startRecord, pageSize);
	%>
	<p class="measureList">班级资料列表</p>
	<div class="list">
		<table>
			<tr>
			  <th>
	  				  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method=post>
	  				  	
	  				  	全选/反选<br /><input type="checkbox" id="checkall" name="checkall" onclick="checkAll(checkall)" /><br />
	  				  	  	   <input type="submit" value="删除"  onclick="return confirm('确定删除选择项？')" align="left">
	  				  	</form>
	  				  </th>
				<th>班级编号</th>
				<th>班级名称</th>
				<th>所属专业</th>
				<th>所属学院</th>
				<th>修改资料</th>
				<th>删除资料</th>
			</tr>
			<%
				String classId="",className="",majorName="",depname="";
			for(Class cla:listClass){
				classId=cla.getClassID();
			  className=cla.getClassName();
			  majorName=cla.getMajorName();
			  depname=cla.getDepname();
			%>


			<tr >
			<td align ="center"><input type="checkbox"  name="info" value= " +id+ " /></td>
				<td><%=classId%></td>
				<td><%=className%></td>
				<td><%=majorName%></td>
				<td><%=depname%></td>
				<td><a href="ClassEdit.jsp?classId=<%=classId%>">修改资料</a>
				</td>
				<td><a href="ClassDel.jsp?classId=<%=classId%>"
					onclick="return check();">删除资料</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<br />
	<div class="add">
		<a href="ClassAdd.jsp">新增班级</a>
	</div>
	<table align=right>
		<tr>
			<td><%=Pagination.getPagination(pageNum, pageCount, recordCount, request.getRequestURI())%>
			</td>
		</tr>
	</table>
	<%
		}catch(Exception e){}
	%>
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
