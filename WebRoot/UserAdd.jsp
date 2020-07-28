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
<div class="addList">
<form name="form1" method="post" action="UserSave.jsp" onSubmit="return check();">
<table>
  	<caption>新增管理员资料</caption>
    <tr>
      <td class="right">管理员名称：</td>
      <td><input name="userID" type="text" id="userID" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">管理员性别：</td>
      <td><input name="sex" type="radio" value="男" checked>男
        <input type="radio" name="sex" value="女">女 </td>
     
    </tr>
    <tr>
      <td class="right">登录密码：</td>
      <td><input name="pwd" type="password" id="pwd" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">校验密码：</td>
      <td><input name="confirmPwd" type="password" id="confirmPwd" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="Submit" value="  保  存   "></td>
    </tr>
</table>
</form>
</div>
<br><br><br>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
<script type="text/javascript">
function check()
{
	if(form1.userID.value==""){
		alert("查询名字与课程不能同时为空");
		form1.userID.focus();
		return false;
	}
	if(form1.pwd.value==""){
		alert("请输入密码，密码不允许为空");
		form1.pwd.focus();
		return false;
	}if(form1.pwd.value !=form1.confirmPwd.value){
		alert("查询名字与课程不能同时为空");
		form1.confirmPwd.focus();
		return false;
	}
	return true;
}
</script>
