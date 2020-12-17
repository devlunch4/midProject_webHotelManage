package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;

/**
 * Servlet implementation class idCheck
 */
@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		//0. 클라이언트 전송시 데이터 받기 - 입력한 id
		String inputId = request.getParameter("joinid");
		
		
		//1. service 객체 얻기
		IHotelService service = HotelServiceImpl.getService();
		
		//2. service 메소드 호출  - 결과값 얻기
		String resId = service.selectById(inputId);
		
		//3. 결과값 request에 저장
		request.setAttribute("resId", resId);
		
		//4. jsp로 forwoard
		request.getRequestDispatcher("hotel/idCheck.jsp").forward(request, response);
	}

}
