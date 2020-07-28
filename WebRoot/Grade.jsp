<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
</head>

<body>
  <%
if(session.getAttribute("username")== null || session.getAttribute("username").equals(""))
{
  response.sendRedirect("index.jsp");
}
%>
<jsp:include flush="true" page="head.jsp"/><br /><br />
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/stuinfo";
String userID="root",pwd="123456",sql = "";
try{
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
sql = "select * from test";
Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
ResultSet rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
%>
<p class="measureList">成绩统计列表</p>
<div  class="list">
<table>
  <tr>
	<th>课程名称</th>
    <th>最高分</th>
    <th>最低分</th>
    <th>平均分</th>
</tr>
  <%
  String user_name="";
  while(rs.next()){
  %>
  <tr>
  	<td><%=rs.getString("id")%></td>
    <td><%=rs.getString("max")%></td>
    <td><%=rs.getString("min")%></td>
    <td><%=rs.getString("ping")%></td>
  </tr>
  <%  }
}catch(Exception e){
    System.out.println(e.getMessage());
  } %>
</table>
</div>
<br />

<%

try{
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
sql = "select * from test";
Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
ResultSet rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
%>
<p class="measureList">成绩统计列表</p>
<div  class="list">
<table>
  <tr>
	<th>课程名称</th>
    <th>最高分</th>
    <th>最低分</th>
    <th>平均分</th>
</tr>
  <%
  String user_name="";
  while(rs.next()){
  %>
  <tr>
  	<td><%=rs.getString("id")%></td>
    <td><%=rs.getString("max")%></td>
    <td><%=rs.getString("min")%></td>
    <td><%=rs.getString("ping")%></td>
  </tr>
  <%  }
}catch(Exception e){
    System.out.println(e.getMessage());
  } %>
</table>
</div>

<p>&nbsp;</p>
<p>&nbsp;
</p>
<br><br><br>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
<script type="text/javascript">
function check(){
  if(confirm("删除确认")){
    return true;
  }
  return false;
}
</script>
