<%@ page contentType="text/html; charset=utf-8"%>
<jsp:directive.page import="myBean.Users" />
<jsp:directive.page import="myDAO.UsersDAO" />
<%
// 取一个或者多个 ID 值
		String[] id = request.getParameterValues("id");
		if(id == null || id.length == 0){	out.println("没有选中任何行");	return;	}
		
		String condition = "";
		
		for(int i=0; i<id.length; i++){
			if(i == 0)	condition = "" + id[i];
			else		condition += ", " + id[i];
		}
		
		UsersDAO.delete(condition);
	response.sendRedirect("UserList.jsp");
%>
