package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.AdminInfoVO;

/**
 * Servlet implementation class AdminLogOut
 */
@WebServlet("/AdminLogOut.do")
public class AdminLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		AdminInfoVO vo = (AdminInfoVO) session.getAttribute("adminResult");
		
		String admin_id = vo.getAdmin_id();
		String adminPower = vo.getPower();
		
		int res = 0;
		
		if(admin_id != null && adminPower != null) {
			session.invalidate();
			res = 1;
		} else {
			res = 0;
		}
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
	}

}
