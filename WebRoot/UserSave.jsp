<%@ page contentType="text/html; charset=utf-8"%>
<jsp:directive.page import="myBean.Users"/>
<jsp:directive.page import="myDAO.UsersDAO"/>
<%
request.setCharacterEncoding("utf-8"); //乱码转换成中文
if(UsersDAO.findName(request.getParameter("userID"))){//判断用户是否存在
%>
<script type="text/javascript">
alert("用户名已经存在，请输入其它用户名");
window.history.go(-1);
</script>
<%
  }
  else
  {
    Users user=new Users();//实例化一个管理员用户
  	user.setName(request.getParameter("userID"));
  	user.setPwd(request.getParameter("pwd"));
 	user.setSex(request.getParameter("sex"));
  	UsersDAO.insert(user);//插入该用户
    session.setAttribute("username",request.getParameter("userID"));
    response.sendRedirect("UserList.jsp");//连接到memCenter.jsp页面   
  }
%>
