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
<form name="form1" method="post" action="UserEditServlet?id=<%=request.getParameter("id")%>" onSubmit="return check();">
<br><br><br><br>
 <table>
    <caption>修改密码</caption>
    <tr>
      <td class="right">旧密码：</td>
      <td width="200"><input name="oldPwd" type="password" id="oldPwd" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">新密码： </td>
      <td><input name="pwd" type="password" id="pwd" size="20" maxlength="20"></td>
    </tr>
    <tr>
      <td class="right">校验新密码：</td>
      <td><input name="confirmPwd" type="password" id="confirmPwd" size="20" maxlength="20"></td>
    </tr>
  </table>
  <p align="center">
    <input type="submit" name="Submit" value="  保  存  ">
  </p>
</form>
</div>
<br><br><br><br>
<jsp:include flush="true" page="bottom.jsp"/>
</body>
</html>
<script  type="text/javascript">
function check()
{
	if(form1.oldPwd.value==""){
		alert("请输入旧密码");
		form1.oldPwd.focus();
		return false;
	}
	if(form1.pwd.value==""){
		alert("请输入新密码，新密码不允许为空");
		form1.pwd.focus();
		return false;
	}if(form1.pwd.value !=form1.confirmPwd.value){
		alert("新密码与校验密码不符");
		form1.confirmPwd.focus();
		return false;
	}
	return true;
}
</script>
