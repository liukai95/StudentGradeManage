<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="testJdbc.DbManager" />
<jsp:directive.page import="myBean.Class" />
<jsp:directive.page import="myBean.Studens" />
<jsp:directive.page import="myDAO.StudentsDAO" />
<jsp:directive.page import="myDAO.ClassDAO" />
<jsp:directive.page import="java.util.List" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style1 {
	font-family: "宋体";
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<%
		if (session.getAttribute("username") == null
			|| session.getAttribute("username").equals("")) {
		response.sendRedirect("index.jsp");
			}
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<%!
String classID="",className="";
String studid="",studname="",classid1="",sex="",age="";
 %>
	<br />
	<br />
	<br />
	<div class="addList">
		<form name="form1" method="post" action="StudEditSave.jsp"
			onSubmit="return check();">
			<%request.setCharacterEncoding("utf-8");
List<Studens> listStudens=StudentsDAO.liststudens2(request.getParameter("studId"));
						for(Studens stu:listStudens){
			  studid=stu.getId();
			  studname=stu.getStudName();
			  sex=stu.getSex();
			  age=stu.getAge();
			  classid1=stu.getClassId();
}
						
			%>
			<table>
				<caption>
					<span class="style1"> 修改学生资料 </span>
				</caption>

				<tr>
					<td class="right">学生学号：</td>
					<td><input name="studID" type="text" id="studID" size="20"
						maxlength="12" value="<%=studid%>"></td>
				</tr>
				<tr>
					<td height="35"><div align="right">姓名：</div></td>
					<td><input name="studName" type="text" id="studName" size="20"
						maxlength="20" value="<%=studname%>"></td>
				</tr>
				<tr>
					<td height="35"><div align="right">班级：</div></td>
					<td><select name="classID" id="classID" style="width:133px">
							<%String classID="",className="";
								List<Class> listclass=ClassDAO.listClass();
												  for(Class cla:listclass){												  
												    classID = cla.getClassID();
												    className=cla.getClassName();
							if (classID.equals(classid1)) {
							%>
							<option value="<%=classID%>" selected="selected"><%=className%></option>
							<%
								} else {
							%>
							<option value="<%=classID%>"><%=className%></option>
							<%
								}
														}
							%>
					</select></td>
				</tr>
				<%
					if (sex.equals("男")) {
				%>
				<tr>
					<td height="36"><div align="right">性 别：</div></td>
					<td><input name="sex" type="radio" value="男" checked>
						男 <input type="radio" name="sex" value="女"> 女</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td height="36"><div align="right">性 别：</div></td>
					<td><input name="sex" type="radio" value="男"> 男 <input
						type="radio" name="sex" value="女" checked> 女</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td width="301" height="39"><div align="right">年龄：</div></td>
					<td width="200"><input name="age" type="text" id="age"
						size="20" maxlength="3" value="<%=age%>"></td>
				</tr>
				<tr>
					<td colspan="2"><div align="center">
							<input type="submit" name="Submit" value="  保  存   ">
						</div></td>
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
