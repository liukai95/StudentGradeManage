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

public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 7381169134016556647L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		// ������Ӧ�����õı��뷽ʽ
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			System.out.println(request.getParameter("id") + ""
					+ request.getParameter("oldPwd"));
			if ((UsersDAO.find(new Integer(request.getParameter("id")),
					request.getParameter("oldPwd")))) {
				Users user = new Users();// ʵ����һ������Ա�û�
				user.setId(new Integer(request.getParameter("id")));
				user.setPwd(request.getParameter("pwd"));
				UsersDAO.updatePwd(user);// ����
				RequestDispatcher rd = request
						.getRequestDispatcher("UserList.jsp");
				rd.forward(request, response);
			} else {
				out.println("<script>");// ���script��ǩ
				out.println("alert('���������');");// js��䣺���alert���
				out.println("history.back();");// js��䣺�����ҳ�������
				out.println("</script>");// ���script��β��ǩ

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
