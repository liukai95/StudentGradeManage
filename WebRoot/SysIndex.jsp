<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
  <%
if(session.getAttribute("username")== null || session.getAttribute("username").equals(""))
{
  response.sendRedirect("index.jsp");
}
%>
<jsp:include flush="true" page="head.jsp"/><br /><br />
<p class="measureList">系统设置主界面</p>   
     <ul id="sys">
      <li><a href="DepList.jsp">学院设置</a>：</li>
      <li><a href="MajorList.jsp">专业设置</a>：</li>
      <li><a href="MajorCourseList.jsp">专业课程设置</a>：</li>
      <li><a href="ClassList.jsp">班级设置</a>：</li>
     </ul>

<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
