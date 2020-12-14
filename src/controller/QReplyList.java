package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQBoardService;
import service.QBoardServiceImpl;
import vo.QReplyVO;

/**
 * Servlet implementation class RevReplyList
 */
@WebServlet("/QReplyList.do")
public class QReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QReplyList() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. q_no가져오기
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		//1. service객체 얻기
		IQBoardService service = QBoardServiceImpl.getService();
		//2. service메소드 호출 - 결과값 얻기
		List<QReplyVO> list = service.listQReply(q_no);
		//3. 결과값을request에 저장
		request.setAttribute("list", list);
		//4. ..jsp로 forward
		request.getRequestDispatcher("hotel/qReplyList.jsp").forward(request, response);
		
	}

}
