<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<jsp:directive.page import="myBean.Class" />
<jsp:directive.page import="myDAO.ClassDAO" />
<%
	ClassDAO.delete(request.getParameter("classId"));
	response.sendRedirect("ClassList.jsp");
%>
