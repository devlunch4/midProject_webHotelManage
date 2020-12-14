package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQBoardService;
import service.QBoardServiceImpl;

/**
 * Servlet implementation class RevReplyDelete
 */
@WebServlet("/QReplyDelete.do")
public class QReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QReplyDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0.
		int qre_no = Integer.parseInt(request.getParameter("qre_no"));
		
		//1. service객체 얻기
		IQBoardService service = QBoardServiceImpl.getService();
		
		//2. service메소드 호출 - 결과값 받기
		int result = service.deleteQReply(qre_no);
		
		//3. 결과를 request에 정장
		request.setAttribute("res", result);
		
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}


}
