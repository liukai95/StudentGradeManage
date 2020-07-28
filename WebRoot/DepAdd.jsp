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
<form name="form1" method="post" action="DepAddSave.jsp" onSubmit="return check();">
  <table>
    <caption>新增学院资料</caption>
   <tr>
      <td class="right">学院编号：</td>
      <td><input name="depID" type="text" id="depID" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">名称：</td>
      <td><input name="depName" type="text" id="depName" maxlength="20"></td>
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
	if(form1.depID.value=="")
	{
		alert("请输入学院编号");
		form1.depID.focus();
		return false;
	}
	if(form1.depName.value=="")
	{
		alert("请输入学院名称");
		form1.depName.focus();
		return false;
	}
	
	return true;

}

</script>
