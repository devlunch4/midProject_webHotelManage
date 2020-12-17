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
 * Servlet implementation class MyMemberInfoList
 */
@WebServlet("/MyMemberInfoList.do")
public class MyMemberInfoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = (String) request.getParameter("MEM_ID");
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		MemberInfoVO vo = service.getMemberInfoVal(userId);
		
		request.setAttribute("res", vo);
		
		request.getRequestDispatcher("hotel/getMemberInfoVal.jsp").forward(request, response);
		
		
	}

}
