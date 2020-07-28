<%@page contentType="text/html; charset=utf-8"%>
<jsp:directive.page import="myBean.Studens" />
<jsp:directive.page import="myDAO.StudentsDAO" />
<%
	request.setCharacterEncoding("utf-8"); //乱码转换成中文
	if (StudentsDAO.find(request.getParameter("studID"))) {//判断用户是否存在
%>
<script type="text/javascript">
	alert("学生编号已存在，请选择其它编号");
	window.history.go(-1);
</script>
<%
	} else {
		Studens stu = new Studens();//实例化一个学生	
		stu.setId(request.getParameter("studID"));
		stu.setStudName(request.getParameter("studName"));
		stu.setSex(request.getParameter("sex"));
		stu.setAge(request.getParameter("age"));
		stu.setClassId(request.getParameter("classID"));
		StudentsDAO.insert(stu);//插入该用户
		response.sendRedirect("StudList.jsp");

	}
%>
