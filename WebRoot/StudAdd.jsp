<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<jsp:directive.page import="myBean.Class" />
<jsp:directive.page import="myDAO.ClassDAO" />
<jsp:directive.page import="java.util.List" />
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
	<jsp:include flush="true" page="head.jsp" /><br />
	<br />
	<br />
	<br />
	<div class="addList">
		<form name="form1" method="post" action="StudAddSave.jsp"
			onSubmit="return check();">
			<table>
				<caption>新增学生资料</caption>
				<tr>
					<td class="right">学生编号：</td>
					<td><input name="studID" type="text" id="studID" size="20"
						maxlength="12">
					</td>
				</tr>
				<tr>
					<td class="right">学生姓名：</td>
					<td><input name="studName" type="text" id="studName" size="20"
						maxlength="20">
					</td>
				</tr>
				<tr>
					<td height="35"><div align="right">所在班级：</div>
					</td>
					<td><select name="classID" id="classID" style="width:133px">
							<%!String classID = "", className = "";%>
							<%
								request.setCharacterEncoding("utf-8"); 
							  List<Class> listclass=ClassDAO.listClass();
							  for(Class cla:listclass){
							  
							    classID = cla.getClassID();
							    className=cla.getClassName();
							%>
							<option value="<%=classID%>"><%=className%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td class="right">性 别：</td>
					<td><input name="sex" type="radio" value="男" checked>男
						<input type="radio" name="sex" value="女">女</td>
				</tr>
				<tr>
					<td class="right">年 龄：</td>
					<td width="200"><input name="age" type="text" id="age"
						size="20" maxlength="3">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="Submit"
						value="  保  存   ">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include flush="true" page="bottom.jsp" />
</body>
</html>
<script type="text/javascript">
	function check() {
		if (form1.studID.value == "") {
			alert("请输入学生编号");
			form1.studID.focus();
			return false;
		}
		if (form1.studID.value.length > 12) {
			alert("学生编号最大只能为12位");
			form1.studID.focus();
			return false;
		}
		if (form1.studName.value == "") {
			alert("请输入学生姓名");
			form1.studName.focus();
			return false;
		}
		if (form1.age.value == "") {
			alert("请输入学生年龄");
			form1.age.focus();
			return false;
		}
		if (isNaN(form1.age.value)) {
			alert("学生年龄含有非法字符");
			form1.age.focus();
			return false;
		}
		return true;

	}
</script>
