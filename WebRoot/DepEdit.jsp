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
<form name="form1" method="post" action="DepEditSave.jsp" onSubmit="return check();">
<input type="hidden" name="DepID" value="<%=request.getParameter("DepID")%>">
<%!
String depname="";
 %>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/stuinfo";
String userID="root",pwd="123456",sql = "";
try{
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
  request.setCharacterEncoding("utf-8"); //乱码转换成中文
  sql = "select * from department where depid='" + request.getParameter("DepID") + "'";
  Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  ResultSet rs  = stmt.executeQuery(sql); //把查询结果放入ResultSet对象
  if(rs.next()){
    depname=rs.getString("DepName");
  }
 }catch(Exception e){
  System.out.println(e.getMessage());
}
  %>

  <table>
    <caption>
    修改学院资料
    </caption>
    <tr>
      <td class="right">学院名称：</td>
      <td width="200"><input name="depName" type="text" id="depName"  value="<%=depname%>" maxlength="20"></td>
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
	if(form1.depName.value=="")
	{
		alert("请输入学院名称");
		form1.depName.focus();
		return false;
	}
	return true;

}

</script>
