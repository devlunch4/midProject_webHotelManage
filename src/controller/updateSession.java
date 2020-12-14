package controller;

import java.io.IOException;
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
 * Servlet implementation class updateSession
 */
@WebServlet("/updateSession.do")
public class updateSession extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("mem_id");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		MemberInfoVO vo = new MemberInfoVO();
		
		vo.setMem_id(userId);
		
		vo = service.getMemberInfoVal(userId);
		
		session.setAttribute("result", vo);
		
		request.getRequestDispatcher("hotel/loginIn.jsp").forward(request, response);
		
		
	}

}
