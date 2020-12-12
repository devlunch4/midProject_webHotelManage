package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IReviewService;
import service.ReviewServiceImpl;
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
		
		String rev_title = request.getParameter("rev_title");
		String rev_cont = request.getParameter("rev_cont");
//		String noti_date = request.getParameter("noti_date");
//		String admin_id = request.getParameter("admin_id");
		
		ReviewVO vo = new ReviewVO();
		
		vo.setRev_title(rev_title);
		vo.setRev_cont(rev_cont);
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
