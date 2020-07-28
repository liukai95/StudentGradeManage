<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/stuinfo";
	String userID="root",pwd="123456",sql = "";
  try {
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, userID, pwd); //建立与数据的连接
    request.setCharacterEncoding("gb2312");
    Statement stmt = conn.createStatement(); //建立Statement的实例，相当于创建一个查询分析器的运行环境
    sql = "select * from majorcourse where MajorID='" + request.getParameter("MajorID") + "' and CourseID='" + request.getParameter("CourseID") + "' and recid <>" + request.getParameter("recID");
    ResultSet rs = stmt.executeQuery(sql);
    if (!rs.next()) {
      sql = "update majorcourse set MajorID = '" + request.getParameter("MajorID") + "',CourseID='" + request.getParameter("CourseID") + "' where recid='" + request.getParameter("recID") + "'";
      if (stmt.executeUpdate(sql) > 0) {
        response.sendRedirect("MajorCourseList.jsp");
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
