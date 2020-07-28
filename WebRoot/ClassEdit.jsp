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
<jsp:include flush="true" page="head.jsp"/><br />
<div class="addList">
<form name="form1" method="post" action="ClassEditSave.jsp" onSubmit="return check();">
<%!
String classname="",classid="",majorid="";
ResultSet rs=null,rs1=null;
Statement stmt=null;
 %>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/stuinfo";
String userID="root",pwd="123456",sql = "";
try{
request.setCharacterEncoding("utf-8"); //乱码转换成中文
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
  stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  sql = "select * from class where classid='" + request.getParameter("classId") + "'";
  rs1  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象

  if(rs1.next()){
    classid=rs1.getString("classid");
    classname=rs1.getString("classname");
    majorid=rs1.getString("majorid");
  }
 }catch(Exception e){
  System.out.println(e.getMessage());
}
  %>
<input type="hidden" name="classID" value="<%=classid%>"/>

  <table>
    <caption>
    修改班级资料
    </caption>
    <tr>
      <td class="right">所属专业：</td>
      <td><select name="majorid" style="width:133px">
      <%
      String tempmajorid="",majorname="";
      try{
        sql = "select * from major";
        rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
        while(rs.next())
        {
          tempmajorid = rs.getString("majorid");
          majorname = rs.getString("majorname");
          if(tempmajorid.equals(majorid)){
%>
<option value="<%=tempmajorid%>" selected="selected"><%=majorname%></option>
<%
          }else{
%>
<option value="<%=tempmajorid%>"><%=majorname%></option>
<%
          }
        }
      }catch(Exception e){}
      %>
      </select></td>
    </tr>
    <tr>
      <td class="right">班级名称：</td>
      <td width="200"><input name="className" type="text" id="className"  value="<%=classname%>" maxlength="20"></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit" value="  保  存   ">
      </div></td>
    </tr>
  </table>
</form>
</div>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
<script type="text/javascript">
function check()
{
	if(form1.className.value=="")
	{
		alert("请输入班级名称");
		form1.className.focus();
		return false;
	}
	return true;

}

</script>
