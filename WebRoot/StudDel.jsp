<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<jsp:directive.page import="myBean.Studens" />
<jsp:directive.page import="myDAO.StudentsDAO" />
<%
	StudentsDAO.delete(request.getParameter("studId"));
	response.sendRedirect("StudList.jsp");
%>
