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
 * Servlet implementation class InsertResVLog
 */
@WebServlet("/InsertResVLog.do")
public class InsertResVLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String roomIn = request.getParameter("room_in");
		String roomOut = request.getParameter("room_out");
		String memId = request.getParameter("mem_id");
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		String roomPl = request.getParameter("room_pl");
		String roomType = request.getParameter("room_type");
		int roomNum = Integer.parseInt(request.getParameter("room_num"));

		ResvlogVO vo = new ResvlogVO();
		vo.setRoom_in(roomIn);
		vo.setRoom_out(roomOut);
		vo.setMem_id(memId);
		vo.setRoom_no(roomNo);
		vo.setRoom_pl(roomPl);
		vo.setRoom_type(roomType);
		vo.setRoom_num(roomNum);

		IResVLogService service = ResVLogServiceImpl.getService();

		int res = service.insertResVLog(vo);

		request.setAttribute("result", res);

		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);

	}

}
