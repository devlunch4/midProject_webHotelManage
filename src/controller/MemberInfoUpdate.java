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
 * Servlet implementation class MemberInfoUpdate
 */
@WebServlet("/MemberInfoUpdate.do")
public class MemberInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		String mem_name = request.getParameter("mem_name");
		String mem_tel = request.getParameter("mem_tel");
		String mem_addr = request.getParameter("mem_addr");
		String mem_email = request.getParameter("mem_email");
		String power = request.getParameter("power");
		
		MemberInfoVO vo = new MemberInfoVO();
		
		vo.setMem_id(mem_id);
		vo.setMem_pass(mem_pass);
		vo.setMem_name(mem_name);
		vo.setMem_tel(mem_tel);
		vo.setMem_addr(mem_addr);
		vo.setMem_email(mem_email);
		vo.setPower(power);
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		int res = service.adminMemberInfoUpdate(vo);
		System.out.println("request전 res 값 : " + res);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
		
	}

}
