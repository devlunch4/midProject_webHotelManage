package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.MemberInfoVO;

/**
 * Servlet implementation class LogOut
 */
@WebServlet("/LogOut.do")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");
		
		/*
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_email = request.getParameter("mem_email");
		*/
		
		String mem_id = vo.getMem_id();
		String mem_name = vo.getMem_name();
		String mem_email = vo.getMem_email();
		
		System.out.println("mem_id : " + mem_id);
		System.out.println("mem_name : " + mem_name);
		System.out.println("mem_email : " + mem_email);
		
		int res = 0;
		
		if(mem_id != null && mem_name != null && mem_email != null) {
			session.invalidate();
			res = 1;
			System.out.println("로그아웃 res : " + res);
		} else {
			res = 0;
			System.out.println("로그아웃 res : " + res);
		}
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
	}
	
/*	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_email = request.getParameter("mem_email");
		
		System.out.println("mem_id : " + mem_id);
		System.out.println("mem_name : " + mem_name);
		System.out.println("mem_email : " + mem_email);
		
		int res = 0;
		
		if(mem_id != null && mem_name != null && mem_email != null) {
			session.invalidate();
			res = 1;
			System.out.println("로그아웃 res : " + res);
		} else {
			res = 0;
			System.out.println("로그아웃 res : " + res);
		}
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
		
	}
*/
}
