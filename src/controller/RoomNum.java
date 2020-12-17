package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import vo.RoomVO;

/**
 * Servlet implementation class RoomNum
 */
@WebServlet("/RoomNum.do")
public class RoomNum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roomPl = request.getParameter("room_pl");
		String roomType = request.getParameter("room_type");
		
		IHotelService service = HotelServiceImpl.getService();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("room_pl", roomPl);
		map.put("room_type", roomType);
		
		List<RoomVO> list = service.getRoomNo(map);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/roomNo.jsp").forward(request, response);
		
		
	}

}
