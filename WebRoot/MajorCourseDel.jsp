<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/stuinfo";
	String userID="root",pwd="123456",sql = "";
try{
  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url,userID,pwd);//建立与数据的连接
  Statement stmt = conn.createStatement();//建立Statement的实例，相当于创建一个查询分析器的运行环境
  sql = "delete majorcourse where recid='" + request.getParameter("recId") + "'";
  stmt.executeUpdate(sql);
  response.sendRedirect("MajorCourseList.jsp");

}catch(Exception e){
  System.out.println(e.getMessage());
}


%>
