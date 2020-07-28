package myServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myDAO.UsersDAO;
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(request.getParameterValues("info"));
		String[] selectdelete = request.getParameterValues("info");
		String ids = "";
		for (int i = 0; i < selectdelete.length; i++) {
			ids += "'" + selectdelete[i] + "'";
			if (i != selectdelete.length - 1)
				ids += ",";
			try {
				UsersDAO.delete(ids);
				out.print("<script language='javascript'>alert('É¾³ý³É¹¦£¡');window.location.href='UserList.jsp';</script>");
				out.flush();
				out.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block

			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
