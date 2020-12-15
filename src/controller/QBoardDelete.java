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
@WebServlet("/QBoardDelete.do")
public class QBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QBoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		MemberInfoVO vo1 = (MemberInfoVO) session.getAttribute("result");
		String mem_id = vo1.getMem_id();
		
		//0
		QBoardVO vo = new QBoardVO();
		
		vo.setQ_no(q_no);
		vo.setMem_id(mem_id);
		
		//1
		IQBoardService service = QBoardServiceImpl.getService();
		
		//2
		int cnt = service.deleteQBoard(vo);
		

		//3
		request.setAttribute("res", cnt);
		
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
