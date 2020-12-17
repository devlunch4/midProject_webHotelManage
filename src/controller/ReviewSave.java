package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IReviewService;
import service.ReviewServiceImpl;
import vo.MemberInfoVO;
import vo.ReviewVO;

/**
 * Servlet implementation class BoardSave
 */
@WebServlet("/ReviewSave.do")
public class ReviewSave extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ReviewSave() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//0. 클라이언트 데이터 가져오기
		
		HttpSession session = request.getSession();
		
		String rev_title = request.getParameter("rev_title");
		String rev_cont = request.getParameter("rev_cont");
		//String mem_id = request.getParameter("userId");
		
		
		//////////세션에서 id 받아오기
		MemberInfoVO vo1 = (MemberInfoVO) session.getAttribute("result");
		String mem_id = vo1.getMem_id();
		////////////
		
//		String noti_date = request.getParameter("noti_date");
//		String admin_id = request.getParameter("admin_id");
		
		System.out.println("rev_title : " + rev_title);
		System.out.println("rev_cont : " + rev_cont);
		System.out.println("mem_id : " + mem_id);
		
		ReviewVO vo = new ReviewVO();
		
		vo.setRev_title(rev_title);
		vo.setRev_cont(rev_cont);
		vo.setMem_id(mem_id);
//		vo.setNoti_date(noti_date);
//		vo.setAdmin_id(admin_id);
		
//		vo.setWip(request.getRemoteAddr());
		
		//1.
		IReviewService service = ReviewServiceImpl.getService();
		
		//2.
		int rev_no = service.insertReview(vo);
		
		//3.
		request.setAttribute("res", rev_no);
		
		//4.
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
