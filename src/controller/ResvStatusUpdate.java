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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResvStatusUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("자바 진입 ResvStatusUpdate");
	request.setCharacterEncoding("UTF-8");
	
	//0 가져올 객체 가져오기
	String resevNo =  request.getParameter("resev_no");
	String resevState =  request.getParameter("resev_state");
	
	ResvlogVO vo = new ResvlogVO();
	
	vo.setRESEV_NO(resevNo);
	vo.setRESEV_STATE(resevState);
	
	//1 서피스 호출
	IHotelService service = HotelServiceImpl.getService();
	
	//2 수행 건수 확인
	//int cnt = service.
	
	
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
