<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/stuinfo";
	String userID="root",pwd="123456",sql = "";
  try {
    Class.forName(driver); 
    Connection conn = DriverManager.getConnection(url, userID, pwd); //建立与数据的连接
    request.setCharacterEncoding("gb2312"); //乱码转换成中文
    Statement stmt = conn.createStatement(); //建立Statement的实例，相当于创建一个查询分析器的运行环境
    sql = "select * from majorcourse where MajorID='" + request.getParameter("MajorID") + "' and CourseID='" + request.getParameter("CourseID") + "'";
    ResultSet rs = stmt.executeQuery(sql);
    if (!rs.next()) {
      rs.close();
      sql = "insert majorcourse(majorid,courseid) values('" + request.getParameter("MajorID") + "','" + request.getParameter("CourseID") + "')";
      if (stmt.executeUpdate(sql) > 0) {
        response.sendRedirect("MajorCourseList.jsp"); //response对象见第四章,连接到memCenter.jsp页面
      }
    }
    else {
    %>
    <script type="text/javascript">
    alert("该专业的该门课程已经存在，请选择其它课程");
    window.history.go(-1);
    </script>
  <%
    }
  }
  catch (Exception e) {
    System.out.println(e.getMessage());
  }
%>
