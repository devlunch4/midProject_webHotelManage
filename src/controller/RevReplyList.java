package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IReviewService;
import service.ReviewServiceImpl;
import vo.RevReplyVO;

/**
 * Servlet implementation class RevReplyList
 */
@WebServlet("/RevReplyList.do")
public class RevReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevReplyList() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. rev_no가져오기
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		//1. service객체 얻기
		IReviewService service = ReviewServiceImpl.getService();
		//2. service메소드 호출 - 결과값 얻기
		List<RevReplyVO> list = service.listRevReply(rev_no);
		//3. 결과값을request에 저장
		request.setAttribute("list", list);
		//4. ..jsp로 forward
		request.getRequestDispatcher("hotel/revReplyList.jsp").forward(request, response);
		
	}

}
