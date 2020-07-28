package myServlet;

import java.io.IOException;  
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import myBean.Users;  
import myDAO.UsersDAO;  
  
public class LoginServlet extends HttpServlet {  
   private static final long serialVersionUID = 7381169134016556647L;  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
            doPost(request,response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("text/html");  
        //������Ӧ�����õı��뷽ʽ  
        response.setCharacterEncoding("utf-8");  
        String uname=request.getParameter("userID");  
        String passwd=request.getParameter("pwd");  
        PrintWriter out = response.getWriter();
        Users user=new Users();
      	user.setName(uname);
      	user.setPwd(passwd);
        boolean bool;
		try {
			bool = UsersDAO.check(user);
	        if(bool){  	     
	        	RequestDispatcher rd=request.getRequestDispatcher("MemCenter.jsp");  
	        	rd.forward(request,response);  
			 }else{  
				 out.println("<script>");//���script��ǩ
				 out.println("alert('�û������������');");//js��䣺���alert���
				 out.println("history.back();");//js��䣺�����ҳ�������
				 out.println("</script>");//���script��β��ǩ
	        }  

		} catch (Exception e) {
			e.printStackTrace();
		}  
          

    }  
}  
  






















