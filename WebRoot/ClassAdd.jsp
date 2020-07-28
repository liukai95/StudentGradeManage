<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="myBean.Major" />
<jsp:directive.page import="myDAO.MajorDAO" />
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
		<form name="form1" method="post" action="ClassAddSave.jsp"
			onSubmit="return check();">
			<table>
				<caption>新增班级资料</caption>
				<tr>
					<td class="right">选择专业:</td>
					<td><select name="majorID" id="majorID" style="width:133px">

							<%!String majorName = "", majorID = "";%>
							<%
								request.setCharacterEncoding("utf-8"); 
												  List<Major> listMajor=MajorDAO.listMajor();
												  for(Major cla:listMajor){
												  
												    majorID = cla.getMajorID();
												    majorName=cla.getMajorName();
							%>
							<option value="<%=majorID%>"><%=majorName%></option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td class="right">班级编号：</td>
					<td><input name="classID" type="text" id="classID"
						maxlength="20">
					</td>
				</tr>
				<tr>
					<td class="right">班级名称：</td>
					<td width="150"><input name="className" type="text"
						id="className" maxlength="20">
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
		if (form1.classID.value == "") {
			alert("请输入班级编号");
			form1.classID.focus();
			return false;
		}
		if (form1.className.value == "") {
			alert("请输入班级名称");
			form1.className.focus();
			return false;
		}
		return true;

	}
</script>
