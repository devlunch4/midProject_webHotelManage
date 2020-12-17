package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import vo.RoomVO;

/**
 * Servlet implementation class getRoomInfo
 */
@WebServlet("/getRoomInfo.do")
public class getRoomInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IHotelService service = HotelServiceImpl.getService();
		
		List<RoomVO> list = service.getRoomInfoList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/getRoomInfo.jsp").forward(request, response);
		
	}

}
