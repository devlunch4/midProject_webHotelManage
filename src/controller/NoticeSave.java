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
 * Servlet implementation class BoardSave
 */
@WebServlet("/NoticeSave.do")
public class NoticeSave extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public NoticeSave() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//0. 클라이언트 데이터 가져오기
		
		String noti_title = request.getParameter("noti_title");
		String noti_cont = request.getParameter("noti_cont");
//		String noti_date = request.getParameter("noti_date");
//		String admin_id = request.getParameter("admin_id");
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNoti_title(noti_title);;
		vo.setNoti_cont(noti_cont);
//		vo.setNoti_date(noti_date);
//		vo.setAdmin_id(admin_id);
		
//		vo.setWip(request.getRemoteAddr());
		
		//1.
		INoticeService service = NoticeServiceImpl.getService();
		
		//2.
		int noti_no = service.insertNotice(vo);
		
		//3.
		request.setAttribute("res", noti_no);
		
		//4.
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
