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
 * Servlet implementation class RoomList
 */
@WebServlet("/RoomList.do")
public class RoomList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IHotelService service = HotelServiceImpl.getService();
		
		List<RoomVO> list = service.getRoomPlList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/roomPl.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roomType = request.getParameter("room_pl");
		
		IHotelService service = HotelServiceImpl.getService();
		
		List<RoomVO> list = service.getRoomTypeList(roomType);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/roomType.jsp").forward(request, response);
		
		
	}

}
