package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String userId = request.getParameter("MEM_ID");
		String userPassword = request.getParameter("MEM_PASS");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		MemberInfoVO vo = new MemberInfoVO();
		
		vo.setMem_id(userId);
		vo.setMem_pass(userPassword);
		
		List<MemberInfoVO> list = service.getMemberInfo(vo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/loginIn.jsp").forward(request, response);
		
	}

}
