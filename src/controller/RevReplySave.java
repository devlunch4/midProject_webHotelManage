package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IReviewService;
import service.ReviewServiceImpl;
import vo.RevReplyVO;

/**
 * Servlet implementation class RevReplySave
 */
@WebServlet("/RevReplySave.do")
public class RevReplySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevReplySave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//0.ajax 요청시 전송데이터 받기 - reply객체
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		String mem_id = request.getParameter("mem_id");
		String revrep_cont = request.getParameter("revrep_cont");
	
		RevReplyVO vo = new RevReplyVO();
		vo.setRev_no(rev_no);
		vo.setMem_id(mem_id);
		vo.setRevrep_cont(revrep_cont);
		
		//1. service객체 얻기
		IReviewService service = ReviewServiceImpl.getService();
		//2. service메소드 호출 - 결과값 받기
		int revrep_no = service.insertRevReply(vo);
		//3. 결과값을 request에 저장
		request.setAttribute("res", revrep_no);
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
