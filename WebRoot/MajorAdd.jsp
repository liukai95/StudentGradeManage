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
<form name="form1" method="post" action="MajorAddSave.jsp" onSubmit="return check();">
  <table>
    <caption>新增专业资料</caption>
    <tr>
      <td class="right">选择学院:</td>
      <td><select name="depID" id="depID" style="width:133px">

 <%!
String depName="",depID="";
 %>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/stuinfo";
String userID="root",pwd="123456",sql = "";
try{
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
 sql = "select * from department";
  Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  ResultSet rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
  while(rs.next()){
    depID = rs.getString("depID");
    depName=rs.getString("DepName");
%>
<option value="<%=depID%>"><%=depName%></option>
<%  }
 }catch(Exception e){
  System.out.println(e.getMessage());
}
  %>
</select>
      </td>
    </tr>
    <tr>
      <td class="right">专业编号：</td>
      <td><input name="majorID" type="text" id="majorID" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">专业名称:</td>
      <td width="200"><input name="majorName" type="text" id="majorName" maxlength="20"></td>
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
<script type="text/javascript">
function check()
{
	if(form1.majorName.value=="")
	{
		alert("请输入专业名称");
		form1.majorName.focus();
		return false;
	}
	return true;

}

</script>
