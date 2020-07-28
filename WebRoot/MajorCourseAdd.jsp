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
<jsp:include flush="true" page="head.jsp"/><br /><br /><br /><br />
<div class="addList">
<form name="form1" method="post" action="MajorCourseAddSave.jsp">
  <table>
    <caption>新增专业课程</caption>
    <tr>
      <td class="right">专业名称：</td>
      <td><select name="MajorID" id="MajorID" style="width:120px">

 <%!
String MajorName="",MajorID="",CourseName="",CourseID="";
ResultSet rs = null;
Statement stmt=null;
 %>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/stuinfo";
	String userID="root",pwd="123456",sql = "";
try{
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
  sql = "select * from major";
  stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
  while(rs.next()){
    MajorID = rs.getString("MajorID");
    MajorName=rs.getString("MajorName");
%>
<option value="<%=MajorID%>"><%=MajorName%></option>
<%  }
 }catch(Exception e){
  System.out.println(e.getMessage());
}
  %>
</select>
      </td>
    </tr>
    <tr>
      <td class="right">课程名称：</td>
      <td><select name="CourseID" id="CourseID" style="width:120px">
<%
try{
  rs.close();
  sql = "select * from course";
  rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
  while(rs.next()){
    CourseID = rs.getString("CourseID");
    CourseName=rs.getString("CourseName");
%>
        <option value="<%=CourseID%>"><%=CourseName%></option>
        <%  }
 }catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  rs.close();
}
  %>
      </select></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="Submit" value="  保  存   "></td>
    </tr>
  </table>
</form>
 </div>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
