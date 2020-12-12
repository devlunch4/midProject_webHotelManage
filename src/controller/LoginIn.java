package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IMemberInfoService;
import service.MemberInfoServiceImpl;
import vo.MemberInfoVO;

/**
 * Servlet implementation class LoginIn
 */
@WebServlet("/LoginIn.do")
public class LoginIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("MEM_ID");
		String userPassword = request.getParameter("MEM_PASS");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		MemberInfoVO vo = new MemberInfoVO();
		
		vo.setMem_id(userId);
		vo.setMem_pass(userPassword);
		
		vo = service.getMemberInfo(vo);
		
		//request.setAttribute("list", list);
		session.setAttribute("result", vo);
		System.out.println("vo.getMem_id() : " + vo.getMem_id());
		System.out.println("vo.getMem_name() : " + vo.getMem_name());
		System.out.println("vo.getMem_email() : " + vo.getMem_email());
		
		request.getRequestDispatcher("hotel/loginIn.jsp").forward(request, response);
		
	}

}
