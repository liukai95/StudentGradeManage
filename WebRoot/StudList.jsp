<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<jsp:directive.page import="testJdbc.Pagination" />
<jsp:directive.page import="myBean.Studens" />
<jsp:directive.page import="myDAO.StudentsDAO" />
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
		final int pageSize = 10; // 一页显示 10 条记录
		int pageNum = 1; // 当前页数
		int pageCount = 1; // 总页数
		int recordCount = 0; // 总记录数	
			try {
			// 从地址栏参数取当前页数
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
		}
		try {
			recordCount =StudentsDAO.total();
			// 计算总页数
			pageCount = (recordCount + pageSize - 1) / pageSize;
			// 本页从 startRecord 行开始
			int startRecord = (pageNum - 1) * pageSize;
			 List<Studens> listStudens=StudentsDAO.liststudens(startRecord, pageSize);
	%>
	<p class="measureList">学生资料列表</p>
	<div class="list">
		<table>
			<tr>			     <th>
	  				  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method=post>
	  				  	
	  				  	全选/反选<br /><input type="checkbox" id="checkall" name="checkall" onclick="checkAll(checkall)" /><br />
	  				  	  	   <input type="submit" value="删除"  onclick="return confirm('确定删除选择项？')" align="left">
	  				  	</form>
	  				  </th>
				<th>学生学号</th>
				<th>院系</th>
				<th>专业名称</th>
				<th>姓名</th>
				<th>班级</th>
				<th>性 别</th>
				<th>年 龄</th>
				<th>修改资料</th>
				<th>删除资料</th>
			</tr>
			<%
				String studId="",studName="",classid="",sex="",age="",majorname="",depname="";
						for(Studens stu:listStudens){
			  studId=stu.getId();
			  studName=stu.getStudName();
			  sex=stu.getSex();
			  age=stu.getAge();
			  classid=stu.getClassName();
			  majorname=stu.getMajorname();
			  depname=stu.getDepname();
			%>
			<tr>
			<td align ="center"><input type="checkbox"  name="info" value= " +id+ " /></td>
			
				<td><%=studId%></td>
				<td><%=depname%></td>
				<td><%=majorname%></td>
				<td><%=studName%></td>
				<td><%=classid%></td>
				<td><%=sex%></td>
				<td><%=age%></td>
				<td><a href="StudEdit.jsp?studId=<%=studId%>">修改资料</a>
				</td>
				<td><a href="StudDel.jsp?studId=<%=studId%>"
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
		<a href="StudAdd.jsp">新增学生</a>
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
