package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/NoticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
//		String writer = request.getParameter("writer");
		String noti_title = request.getParameter("noti_title");
//		String mail = request.getParameter("mail");
//		String password = request.getParameter("password");
		String noti_cont = request.getParameter("noti_cont");
		int noti_no = Integer.parseInt(request.getParameter("noti_no"));
		
		//0. writer, subject, mail, password, content, seq
		// 가져와서 BoardVO에 저장
		NoticeVO vo = new NoticeVO();
//		vo.setWriter(writer);
		vo.setNoti_title(noti_title);
//		vo.setMail(mail);
//		vo.setPassword(password);
		vo.setNoti_cont(noti_cont);;
		vo.setNoti_no(noti_no);
		
		
		//1
		INoticeService service = NoticeServiceImpl.getService();
		//2
		int cnt = service.updateNotice(vo);
		//3
		request.setAttribute("res", cnt);
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
