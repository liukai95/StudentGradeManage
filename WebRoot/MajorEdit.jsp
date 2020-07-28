<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="testJdbc.DbManager" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
	<%
		if (session.getAttribute("username") == null
				|| session.getAttribute("username").equals("")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<jsp:include flush="true" page="head.jsp" /><br />
	<form name="form1" method="post" action="majorEditSave.jsp"
		onSubmit="return check();">
		<%!String majorname = "", majorid = "", depid = "";%>
		<%
			String sql = null;
			Connection conn = null;
			PreparedStatement preStmt = null;
			ResultSet rs = null;
			try {
				sql = "select * from major where majorid='"
						+ request.getParameter("majorId") + "'";
				conn = DbManager.getConnection();
				preStmt = conn.prepareStatement(sql);
				rs = preStmt.executeQuery();

				if (rs.next()) {
					majorid = rs.getString("majorid");
					majorname = rs.getString("majorname");
					depid = rs.getString("depid");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			finally {
					if (rs != null)
						rs.close();
					if (preStmt != null)
						preStmt.close();
					if (conn != null)
						conn.close();
				}
		%>
		<input type="hidden" name="majorID" value="<%=majorid%>" />
		<table width="500" height="104" border="1" align="center"
			cellpadding="3" cellspacing="1">
			<caption>修改专业资料</caption>
			<tr>
				<td height="50"><div align="right">所属学院：</div>
				</td>
				<td><select name="depId" style="width:133px">
						<%
							String tempdepid = "", depname = "";
							try {
								sql = "select * from department";
								rs = preStmt.executeQuery();
								while (rs.next()) {
									tempdepid = rs.getString("depid");
									depname = rs.getString("depname");
									if (tempdepid.equals(depid)) {
						%>
						<option value="<%=tempdepid%>" selected="selected"><%=depname%></option>
						<%
							} else {
						%>
						<option value="<%=tempdepid%>"><%=depname%></option>
						<%
							}
								}
							} catch (Exception e) {
							}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td width="301" height="50"><div align="right">专业名称：</div>
				</td>
				<td width="446"><input name="majorName" type="text"
					id="majorName" value="<%=majorname%>" maxlength="20">
				</td>
			</tr>
			<tr>
				<td colspan="2"><div align="center">
						<input type="submit" name="Submit" value="  保  存   ">
					</div>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include flush="true" page="bottom.jsp" />
</body>
</html>
<script language="javascript">
	function check() {
		if (form1.majorName.value == "") {
			alert("请输入专业名称");
			form1.majorName.focus();
			return false;
		}
		return true;

	}
</script>
