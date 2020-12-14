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
 * Servlet implementation class RevReplySave
 */
@WebServlet("/QReplySave.do")
public class QReplySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QReplySave() {
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
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		String admin_id = request.getParameter("admin_id");
		String qre_cont = request.getParameter("qre_cont");
	
		QReplyVO vo = new QReplyVO();
		vo.setQ_no(q_no);
		vo.setAdmin_id(admin_id);
		vo.setQre_cont(qre_cont);
		
		//1. service객체 얻기
		IQBoardService service = QBoardServiceImpl.getService();
		//2. service메소드 호출 - 결과값 받기
		int qre_no = service.insertQReply(vo);
		//3. 결과값을 request에 저장
		request.setAttribute("res", qre_no);
		//4. jsp로 forward
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
