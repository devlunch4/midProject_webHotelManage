package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberInfoService;
import service.MemberInfoServiceImpl;
import vo.MemberInfoVO;

/**
 * Servlet implementation class MyMemberInfoUpdate
 */
@WebServlet("/MyMemberInfoUpdate.do")
public class MyMemberInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		String tel = request.getParameter("mem_tel");
		String addr = request.getParameter("mem_addr");
		String email = request.getParameter("mem_email");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		MemberInfoVO vo = new MemberInfoVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_tel(tel);
		vo.setMem_addr(addr);
		vo.setMem_email(email);
		
		int res = service.updateMemberInfo(vo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
