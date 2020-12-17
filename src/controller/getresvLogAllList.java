package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IResVLogService;
import service.ResVLogServiceImpl;
import vo.ResvlogVO;

/**
 * Servlet implementation class getresvLogAllList
 */
@WebServlet("/getresvLogAllList.do")
public class getresvLogAllList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("mem_id");
		
		IResVLogService service = ResVLogServiceImpl.getService();
		
		List<ResvlogVO> list = service.getresvLogAllList(userId);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/getresvLogAllList.jsp").forward(request, response);

		
	}

}
