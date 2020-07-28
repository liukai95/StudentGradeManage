<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<jsp:directive.page import="testJdbc.Pagination" />
<jsp:directive.page import="myBean.Users" />
<jsp:directive.page import="myDAO.UsersDAO" />
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
	<jsp:include flush="true" page="head.jsp" />
	<br />
	<%
		final int pageSize = 8; // 一页显示 10 条记录
		int pageNum = 1; // 当前页数
		int pageCount = 1; // 总页数
		int recordCount = 0; // 总记录数	
			try {
			// 从地址栏参数取当前页数
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
		}
		try {
			recordCount =UsersDAO.total();
			// 计算总页数
			pageCount = (recordCount + pageSize - 1) / pageSize;
			// 本页从 startRecord 行开始
			int startRecord = (pageNum - 1) * pageSize;
			 List<Users> listUsers=UsersDAO.listUsers(startRecord, pageSize);
	%>
	<p class="measureList">管理员资料列表</p>
	<div class="list">
		<table>
			<tr>
			     <th>
	  				  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method=post>
	  				  	
	  				  	全选/反选<br /><input type="checkbox" id="checkall" name="checkall" onclick="checkAll(checkall)" /><br />
	  				  	  	   <input type="submit" value="删除"  onclick="return confirm('确定删除选择项？')" align="left">
	  				  	</form>
	  				  </th>

				<th>ID</th>
				<th>管理员名称</th>
				<th>登录密码</th>
				<th>性别</th>
				<th>修改密码</th>
				<th>删除资料</th>
			</tr>
			<%
				String user_name = "";
						String id = "";
						for(Users user:listUsers){
								user_name = user.getName();
								id=user.getId()+"";
			%>
			<tr>
<td align ="center"><input type="checkbox"  name="info" value= " +id+ " /></td>

				<td><%=id%></td>
				<td><%=user_name%></td>
				<td><%=user.getPwd()%></td>
				<td><%=user.getSex()%></td>
				<td><a href="ChangePwd.jsp?id=<%=id%>">修改密码</a></td>
				<td><a href="UserDel.jsp?id=<%=id%>" onclick="return check();">删除资料</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

	<br />
	<div class="add">
		<a href="UserAdd.jsp">新增管理员</a>
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
	<p>&nbsp;</p>
	<p>&nbsp;</p>
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
<script type="text/javascript">
		function checkAll(checkall) {  
			arr = document.getElementsByName("info"); 
			if (checkall.checked == true) { 
				for(i=0;i<arr.length;i++){ 
					
					arr[i].checked = true; 
				}

				}else{
					for(i=0;i<arr.length;i++){ 
						if((arr[i]).checked==false){
							arr[i].checked = true;
						}else
						{arr[i].checked = false; }
					}
				}
	}  

</script>
