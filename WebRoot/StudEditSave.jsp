<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/stuinfo";
String userID="root",pwd="123456",sql = "";
  try {
    Class.forName(driver); 
    Connection conn = DriverManager.getConnection(url, userID, pwd); //建立与数据的连接
    request.setCharacterEncoding("utf-8"); //乱码转换成中文
    Statement stmt = conn.createStatement(); //建立Statement的实例，相当于创建一个查询分析器的运行环境
    sql = "update students set studname='" + request.getParameter("studName");
    sql = sql  + "',classid='" + request.getParameter("classID");
    sql = sql  + "',sex='" + request.getParameter("sex");
    sql = sql  + "',age='" + request.getParameter("age");
    sql = sql + "' where studid='" + request.getParameter("studID") + "'";
    if (stmt.executeUpdate(sql) > 0) {
      response.sendRedirect("StudList.jsp"); //response对象见第四章,连接到memCenter.jsp页面
    }
  } catch (Exception e) {
    System.out.println(e.getMessage());
  }
%>
