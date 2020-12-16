package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;

/**
 * Servlet implementation class InsertRoom
 */
@WebServlet("/InsertRoom.do")
public class InsertRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roomPl = request.getParameter("room_pl");
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		String roomType = request.getParameter("room_type");
		String roomStatus = request.getParameter("room_status");
		String roomPlName = "";
		
		IHotelService service = HotelServiceImpl.getService();
		
		if(roomPl.equals("본점")) {
			roomPlName = "headroominfo";
		} else if(roomPl.equals("하와이")) {
			roomPlName = "hawaiiroominfo";
		} else {
			roomPlName = null;
		}
		
		Map<Object, Object> map = new HashMap<>();
		
		map.put("room_pl", roomPl);
		map.put("room_no", roomNo);
		map.put("room_type", roomType);
		map.put("room_status", roomStatus);
		map.put("roomPlName", roomPlName);
		
		System.out.println("room_pl : " + map.get("room_pl"));
		System.out.println("room_no : " + map.get("room_no"));
		System.out.println("room_type : " + map.get("room_type"));
		System.out.println("room_status : " + map.get("room_status"));
		System.out.println("roomPlName : " + map.get("roomPlName"));
		
		int res = service.insertRoom(map);
		
		System.out.println("res값 : " + res);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
		
	}

}
