<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/stuinfo";
	String userid="root",pwd="123456",sql = "";
try{
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userid,pwd);//建立与数据的连接
  Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  sql = "delete department where depid='" + request.getParameter("DepID") + "'";
  stmt.executeUpdate(sql);
  response.sendRedirect("DepList.jsp");

}catch(Exception e){
  System.out.println(e.getMessage());
}


%>
