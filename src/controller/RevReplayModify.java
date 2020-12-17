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
 * Servlet implementation class RevReplayModify
 */
@WebServlet("/RevReplayModify.do")
public class RevReplayModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevReplayModify() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//0.
		int revrep_no = Integer.parseInt(request.getParameter("revrep_no"));
		String revrep_cont = request.getParameter("revrep_cont");
		
		//1. service 객체 얻기
		IReviewService service = ReviewServiceImpl.getService();
		
		//2. service메서드 호출 - 결과값 가져오기
		RevReplyVO vo = new RevReplyVO();
		vo.setRevrep_no(revrep_no);
		vo.setRevrep_cont(revrep_cont);
		
		int result = service.updateRevReply(vo);
		
		//3. 결과를 request에 저장
		request.setAttribute("res", result);
		
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
