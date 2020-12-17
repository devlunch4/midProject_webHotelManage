package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import vo.ResvlogVO;

/**
 * Servlet implementation class ResvStatusUpdate
 */
@WebServlet("/resvStatusUpdate.do")
public class ResvStatusUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("자바 진입 ResvStatusUpdate");
	request.setCharacterEncoding("UTF-8");
	
	//0 가져올 객체 가져오기
	int resev_no =  Integer.parseInt(request.getParameter("resev_no"));
	String resev_state =  request.getParameter("resev_state");
	
	
	System.out.println(resev_no + ":"+ resev_state);
	
	ResvlogVO vo = new ResvlogVO();
	
	vo.setResev_no(resev_no);
	vo.setResev_state(resev_state);
	
	//1 서비스 호출
	IHotelService service = HotelServiceImpl.getService();
	
	//2 수행 건수 확인
	int cnt = service.resvStatusUpdate(vo);
	
	// 3. 결과값 저장
	request.setAttribute("res", cnt);
	
	// 4.jsp로 보내기
			request.getRequestDispatcher("hotel/result.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
