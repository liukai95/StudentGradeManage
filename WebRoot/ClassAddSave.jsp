<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:directive.page import="myBean.Class" />
<jsp:directive.page import="myDAO.ClassDAO" />
<%
	request.setCharacterEncoding("utf-8"); //乱码转换成中文
	if (ClassDAO.find(request.getParameter("classID"))) {//判断用户是否存在
%>
<script type="text/javascript">
alert("班级编号已存在，请选择其它编号");
window.history.go(-1);
</script>
<%
	} else {
		Class cla = new Class();//实例化一个学生	
		cla.setClassID(request.getParameter("classID"));
		cla.setClassName(request.getParameter("className"));
		cla.setMajorId(request.getParameter("majorID"));
		response.sendRedirect("ClassList.jsp");
	}
%>