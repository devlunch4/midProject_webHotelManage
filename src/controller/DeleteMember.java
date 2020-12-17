package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberInfoService;
import service.MemberInfoServiceImpl;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/DeleteMember.do")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("mem_id");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		int res = service.deleteMember(memId);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		

	}

}
