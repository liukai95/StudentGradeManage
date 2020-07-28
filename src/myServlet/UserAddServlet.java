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
		// 设置响应所采用的编码方式
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			System.out.println(request.getParameter("id") + ""
					+ request.getParameter("oldPwd"));
			if ((UsersDAO.find(new Integer(request.getParameter("id")),
					request.getParameter("oldPwd")))) {
				Users user = new Users();// 实例化一个管理员用户
				user.setId(new Integer(request.getParameter("id")));
				user.setPwd(request.getParameter("pwd"));
				UsersDAO.updatePwd(user);// 更新
				RequestDispatcher rd = request
						.getRequestDispatcher("UserList.jsp");
				rd.forward(request, response);
			} else {
				out.println("<script>");// 输出script标签
				out.println("alert('旧密码错误');");// js语句：输出alert语句
				out.println("history.back();");// js语句：输出网页回退语句
				out.println("</script>");// 输出script结尾标签

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
