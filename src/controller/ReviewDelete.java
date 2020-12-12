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
 * Servlet implementation class BoardDelete
 */
@WebServlet("/ReviewDelete.do")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		//1
		IReviewService service = ReviewServiceImpl.getService();
		
		//2
		int cnt = service.deleteReview(rev_no);
		
		//3
		request.setAttribute("res", cnt);
		
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
