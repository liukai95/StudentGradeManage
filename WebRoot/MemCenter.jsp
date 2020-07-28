<%@ page contentType="text/html; charset=utf-8"  errorPage="" %>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="username" class="myBean.Users" scope="request"/>   
<jsp:setProperty name="username" property="*"/>  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%
	session.setAttribute("username",request.getParameter("userID"));
%>
<jsp:include flush="true" page="head.jsp"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
当前管理员是：<%=session.getAttribute("username")%>,欢迎您！！
 <c:set var="dateTest" value="<%=new Date()%>"/>
     现在时间是:
     <fmt:formatDate value="${dateTest}" pattern=" yyyy'年'MM'月'dd'日' HH:mm:ss "/>
     <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  您的IP是:<%=request.getRemoteAddr() %><br>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你的主机是:<%=request.getRemoteHost() %><br>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你使用的协议是:<%=request.getProtocol() %><br>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你目前的地址是:<%=request.getRealPath("/") %>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你的主机端口是:<%=request.getRemotePort() %> 
<hr align="center" width="768" size="1">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include flush="true" page="bottom.jsp"/>

</body>
</html>
