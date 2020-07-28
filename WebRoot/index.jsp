<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<title>学生信息管理系统</title>
</head>

<body background="images/index.jpg">
<br><br><br><br><br><br><br><br><br><br><br><br><br>

<form name="form1" method="post" action="LoginServlet" onSubmit="return check();">
  <table width="315" height="101" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#33FF66" bgcolor="#6699FF">
    <tr>
      <td width="105" height="33"><div align="right">用户姓名：</div></td>
      <td width="189"><input name="userID" type="text" id="userID" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td height="33"><div align="right">登录密码：</div></td>
      <td><input name="pwd" type="password" id="pwd" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td colspan="2">
        <div align="center">
          <input type="submit" name="Submit" value="  登  录   ">
        </div></td>
    </tr>
  </table>
</form>
</body>
</html>
<script type="text/javascript">
function check()
{
	if(form1.userID.value=="")
	{
		alert("请输入用户名");
		form1.userID.focus();
		return false;
	}
	if(form1.pwd.value=="")
	{
		alert("请输入登录密码");
		form1.pwd.focus();
		return false;
	}
	return true;
}
</script>
