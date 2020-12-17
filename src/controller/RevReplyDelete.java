package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IReviewService;
import service.ReviewServiceImpl;

/**
 * Servlet implementation class RevReplyDelete
 */
@WebServlet("/RevReplyDelete.do")
public class RevReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevReplyDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0.
		int revrep_no = Integer.parseInt(request.getParameter("revrep_no"));
		
		//1. service객체 얻기
		IReviewService service = ReviewServiceImpl.getService();
		
		//2. service메소드 호출 - 결과값 받기
		int result = service.deleteRevReply(revrep_no);
		
		//3. 결과를 request에 정장
		request.setAttribute("res", result);
		
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}


}
