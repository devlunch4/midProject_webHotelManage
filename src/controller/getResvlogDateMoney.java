package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IResVLogService;
import service.ResVLogServiceImpl;
import vo.ResvlogVO;

/**
 * Servlet implementation class getResvlogDateMoney
 */
@WebServlet("/getResvlogDateMoney.do")
public class getResvlogDateMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("resev_date");
		System.out.println("DB에 들어갈 date날짜 값" + date);
		
		IResVLogService service = ResVLogServiceImpl.getService();
		
		List<ResvlogVO> list = service.getResvlogDateMoney(date);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("hotel/resvLogAllList.jsp").forward(request, response);
		
		
	}

}
