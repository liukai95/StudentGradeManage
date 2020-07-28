<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<jsp:directive.page import="testJdbc.Pagination" />
<jsp:directive.page import="testJdbc.DbManager"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%
  if (session.getAttribute("username") == null || session.getAttribute("username").equals("")) {
    response.sendRedirect("index.jsp");
  }
  
		final int pageSize = 8; // 一页显示 10 条记录
		int pageNum = 1; // 当前页数
		int pageCount = 1; // 总页数
		int recordCount = 0; // 总记录数	
%>
<jsp:include flush="true" page="head.jsp"/>
<br/>
<p align="center">
  <strong>
    <font size="4" color="#FF0000"">专业课程资料列表</font>
  </strong>
</p>
<div  class="list">
<table>
  <tr>
   <th>
	  				  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method=post>
	  				  	
	  				  	全选/反选<br /><input type="checkbox" id="checkall" name="checkall" onclick="checkAll(checkall)" /><br />
	  				  	  	   <input type="submit" value="删除"  onclick="return confirm('确定删除选择项？')" align="left">
	  				  	</form>
	  				  </th>
    <th>专业名称</th>
    <th>课程名称</th>
    <th>所属学院</th>
    <th>修改资料</th>
    <th>删除资料</th>
  </tr>
<%
	try{
		// 从地址栏参数取当前页数
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}catch(Exception e){}
	
	String sql = null;
	
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet rs = null;
    try{
		sql = "SELECT count(*) from majorcourse m1 left outer join major m2 on m1.majorid=m2.majorid left outer join Course c on m1.courseid=c.courseid left outer join department d on m2.depid=d.depid ";
		
		recordCount = DbManager.getCount(sql);
		
		// 计算总页数
		pageCount = ( recordCount + pageSize - 1 ) / pageSize;
		// 本页从 startRecord 行开始
		int startRecord = ( pageNum - 1) * pageSize;
		
		// MySQL 使用limit实现分页
		sql = "select m1.recid,m2.majorname,c.coursename,d.depname from majorcourse m1 left outer join major m2 on m1.majorid=m2.majorid left outer join Course c on m1.courseid=c.courseid left outer join department d on m2.depid=d.depid LIMIT ?, ? ";
		
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		DbManager.setParams(preStmt, startRecord, pageSize);
		rs = preStmt.executeQuery();
  String recid = "", majorname = "", coursename="",depname = "";
    while (rs.next()) {
      recid = rs.getString("recid");
      majorname = rs.getString("majorname");
      coursename = rs.getString("coursename");
      depname = rs.getString("depname");
%>
  <tr>
  <td align ="center"><input type="checkbox"  name="info" value= " +id+ " /></td>
    <td><%=majorname%></td>
    <td><%=coursename%></td>
    <td><%=depname%></td>
    <td><a href="MajorCourseEdit.jsp?recId=<%=recid%>">修改资料</a></td>
    <td><a href="MajorCourseDel.jsp?recId=<%=recid%>" onclick="return check();">删除资料</a></td>
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
  <a href="MajorCourseAdd.jsp">新增专业课程</a>
</div>
	<table align=right>
		<tr>
			<td><%=Pagination.getPagination(pageNum, pageCount, recordCount, request.getRequestURI())%>
			</td>
		</tr>
	</table>
<br/>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
<script language="javascript">
	function check()
	{
		if(confirm("删除确认"))
		{
			return true;
		}
		return false;
	}
</script>
