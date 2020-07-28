<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%
  if (session.getAttribute("username") == null || session.getAttribute("username").equals("")) {
    response.sendRedirect("index.jsp");
  }
%>
<jsp:include flush="true" page="head.jsp"/>
<br/>
<br/>
<br/>
<br/>
<form name="form1" method="post" action="MajorCourseEditSave.jsp">
<input type="hidden" name="recID" value="<%=request.getParameter("recId")%>">
<table width="500" height="104" border="1" align="center" cellpadding="3" cellspacing="1">
  <caption>修改专业课程  </caption>
  <tr>
    <td height="50">
      <div align="right">专业名称：</div>
    </td>
    <td>
      <select name="MajorID" id="MajorID" style="width:133px">
      <%!
        String MajorName = "", MajorID = "", CourseName = "", CourseID = "", tempmajorid = "", tempcourseid = "";
        ResultSet rs = null;
        Statement stmt = null;
      %>
      <%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/stuinfo";
		String userID="root",pwd="123456",sql = "";
        try {
          Class.forName(driver); 
          Connection conn = DriverManager.getConnection(url, userID, pwd); //建立与数据的连接
          stmt = conn.createStatement(); //建立Statement的实例，相当于创建一个查询分析器的运行环境
          sql = "select * from majorcourse where recid=" + request.getParameter("recId");
          rs = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
          rs.next();
          tempmajorid = rs.getString("MajorID");
          tempcourseid = rs.getString("CourseID");
          rs.close();
          sql = "select * from Major";
          rs = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
          while (rs.next()) {
            MajorID = rs.getString("MajorID");
            MajorName = rs.getString("MajorName");
            if (MajorID.equals(tempmajorid)) {
      %>
        <option value="<%=MajorID%>" selected="selected"><%=MajorName%>        </option>
      <%
        } else {
      %>
        <option value="<%=MajorID%>"><%=MajorName%>        </option>
      <%
        }
        }
        } catch (Exception e) {
          System.out.println(e.getMessage());
        }
      %>
      </select>
    </td>
  </tr>
  <tr>
    <td width="301" height="50">
      <div align="right">课程名称：</div>
    </td>
    <td width="446">
      <select name="CourseID" id="CourseID" style="width:133px">
      <%
        try {
          rs.close();
          sql = "select * from course";
          rs = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
          while (rs.next()) {
            CourseID = rs.getString("CourseID");
            CourseName = rs.getString("CourseName");
            if(CourseID.equals(tempcourseid)){
      %>
        <option value="<%=CourseID%>" selected="selected"><%=CourseName%>        </option>
      <%

            }else{
      %>
        <option value="<%=CourseID%>"><%=CourseName%>        </option>
      <%
            }}
        } catch (Exception e) {
          System.out.println(e.getMessage());
        }
        finally {
          rs.close();
        }
      %>
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <input type="submit" name="Submit" value=" 保  存 ">
      </div>
    </td>
  </tr>
</table>
</form>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
