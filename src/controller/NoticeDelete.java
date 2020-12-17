package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/NoticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0
		int noti_no = Integer.parseInt(request.getParameter("noti_no"));
		
		//1
		INoticeService service = NoticeServiceImpl.getService();
		
		//2
		int cnt = service.deleteNotice(noti_no);
		
		//3
		request.setAttribute("res", cnt);
		
		//4
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
	}

}
