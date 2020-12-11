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
import vo.ResvlogVO;

/**
 * Servlet implementation class ResvLogAllList
 */
@WebServlet("/resvLogAllList.do")

public class ResvLogAllList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ResvLogAllList() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// resv 로그 전체 가져오기
		// 0
		// 1 서비스객체 호출
		IHotelService service = HotelServiceImpl.getService();

		// 2 메소드 호출
		List<ResvlogVO> list = service.resvLogAllList();
		// 3결과값 저장
		request.setAttribute("list", list);

		// 4. jsp로 보내기
		request.getRequestDispatcher("hotel/resvLogAllList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
