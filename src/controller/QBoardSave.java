package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IQBoardService;
import service.QBoardServiceImpl;
import vo.MemberInfoVO;
import vo.QBoardVO;
import vo.ReviewVO;

/**
 * Servlet implementation class BoardSave
 */
@WebServlet("/QBoardSave.do")
public class QBoardSave extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public QBoardSave() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		//0. 클라이언트 데이터 가져오기
		
		String q_title = request.getParameter("q_title");
		String q_cont = request.getParameter("q_cont");
		
		//////////세션에서 id 받아오기
		MemberInfoVO vo1 = (MemberInfoVO) session.getAttribute("result");
		String mem_id = vo1.getMem_id();
		
		QBoardVO vo = new QBoardVO();
		
		vo.setQ_title(q_title);
		vo.setQ_cont(q_cont);
		vo.setMem_id(mem_id);
		
		//1.
		IQBoardService service = QBoardServiceImpl.getService();
		
		//2.
		int q_no = service.insertQBoard(vo);
		
		//3.
		request.setAttribute("res", q_no);
		
		//4.
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
