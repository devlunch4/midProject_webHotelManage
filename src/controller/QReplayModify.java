package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQBoardService;
import service.QBoardServiceImpl;
import vo.QReplyVO;

/**
 * Servlet implementation class RevReplayModify
 */
@WebServlet("/QReplayModify.do")
public class QReplayModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QReplayModify() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//0.
		int qre_no = Integer.parseInt(request.getParameter("qre_no"));
		String qre_cont = request.getParameter("qre_cont");
		
		//1. service 객체 얻기
		IQBoardService service = QBoardServiceImpl.getService();
		
		//2. service메서드 호출 - 결과값 가져오기
		QReplyVO vo = new QReplyVO();
		vo.setQre_no(qre_no);
		vo.setQre_cont(qre_cont);
		
		int result = service.updateQReply(vo);
		
		//3. 결과를 request에 저장
		request.setAttribute("res", result);
		
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
