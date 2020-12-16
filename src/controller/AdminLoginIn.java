package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminInfoServiceImpl;
import service.IAdminInfoService;
import service.IMemberInfoService;
import service.MemberInfoServiceImpl;
import vo.AdminInfoVO;

/**
 * Servlet implementation class AdminLoginIn
 */
@WebServlet("/AdminLoginIn.do")
public class AdminLoginIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String adminId = request.getParameter("admin_id"); 
		String adminPass = request.getParameter("admin_pass"); 
		
		IAdminInfoService service = AdminInfoServiceImpl.getService();
		
		AdminInfoVO vo = new AdminInfoVO();
		
		vo.setAdmin_id(adminId);
		vo.setAdmin_pass(adminPass);
		
		vo = (AdminInfoVO) service.getAdminInfo(vo);
		
		session.setAttribute("adminResult", vo);
		
		request.getRequestDispatcher("hotel/AdminloginIn.jsp").forward(request, response);
		
	}

}
