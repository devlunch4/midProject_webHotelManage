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
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/QBoardUpdate.do")
public class QBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QBoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
//		String writer = request.getParameter("writer");
		String q_title = request.getParameter("q_title");
//		String mail = request.getParameter("mail");
//		String password = request.getParameter("password");
		String q_cont = request.getParameter("q_cont");
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		MemberInfoVO vo1 = (MemberInfoVO) session.getAttribute("result");
		String mem_id = vo1.getMem_id();
		
		//0. writer, subject, mail, password, content, seq
		// 가져와서 BoardVO에 저장
		QBoardVO vo = new QBoardVO();
		vo.setQ_title(q_title);
//		vo.setMail(mail);
//		vo.setPassword(password);
		vo.setQ_cont(q_cont);;
		vo.setQ_no(q_no);
		vo.setMem_id(mem_id);
		
		
		
		//1
		IQBoardService service = QBoardServiceImpl.getService();
		//2
		int cnt = service.updateQBoard(vo);
		//3
		request.setAttribute("res", cnt);
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
