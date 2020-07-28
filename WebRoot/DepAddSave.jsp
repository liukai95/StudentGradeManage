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
    sql = "select * from department where depid='" + request.getParameter("depID") + "'";
    ResultSet rs = stmt.executeQuery(sql);
    if(rs.next())
    {
%>
<script type="text/javascript">
alert("学院编号已存在，请选择其它编号");
window.history.go(-1);
</script>
<%
    }
    rs.close();
	sql = "insert department values('" + request.getParameter("depID") + "','"  + request.getParameter("depName") + "')";
    if (stmt.executeUpdate(sql) > 0) {
      response.sendRedirect("DepList.jsp"); 
    }
  } catch (Exception e) {
    System.out.println(e.getMessage());
  }
%>
