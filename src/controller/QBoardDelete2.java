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

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/QBoardDelete2.do")
public class QBoardDelete2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QBoardDelete2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
//		MemberInfoVO vo1 = (MemberInfoVO) session.getAttribute("result");
//		String mem_id = vo1.getMem_id();
		//0
		QBoardVO vo = new QBoardVO();
		
		vo.setQ_no(q_no);
//		vo.setMem_id(mem_id);
		
		//1
		IQBoardService service = QBoardServiceImpl.getService();
		
		//2
		int cnt = service.deleteQBoard2(vo);
		

		//3
		request.setAttribute("res", cnt);
		
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
