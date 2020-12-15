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
 * Servlet implementation class GetMemberInfoList
 */
@WebServlet("/GetMemberInfoList.do")
public class GetMemberInfoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMemberInfoService service = MemberInfoServiceImpl.getService();
		
		List<MemberInfoVO> list = service.getMemberInfoList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/getMemberInfoList.jsp").forward(request, response);
		
	}

}
