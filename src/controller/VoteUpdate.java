package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import vo.VoteVO;

/**
 * Servlet implementation class VoteUpdate
 */
@WebServlet("/voteUpdate.do")
public class VoteUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println();
		System.out.println("회원가져오기0");
		System.out.println();
		int staff_code = Integer.parseInt(request.getParameter("code"));
		int staff_score = Integer.parseInt(request.getParameter("count"));
		
		System.out.println();
		System.out.println("회원가져오기2");
		System.out.println();
		
		VoteVO vo = new VoteVO();
		
		vo.setStaff_code(staff_code);
		vo.setStaff_score(staff_score);
		
		System.out.println();
		System.out.println("회원가져오기3");
		System.out.println();
		
		IHotelService service = HotelServiceImpl.getService();
		
		int cnt = service.updateMemberVote(vo);
			
		
		System.out.println();
		System.out.println("회원가져오기4");
		System.out.println();
		
		request.setAttribute("res", cnt);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IHotelService service = HotelServiceImpl.getService();
		
		List<VoteVO> list = service.votelistAll();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/VoteVOlistAll.jsp").forward(request, response);
		
		
		
		
		/*super.doGet(req, resp);*/
	}
}

