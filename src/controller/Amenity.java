package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FacServiceImpl;
import service.IFacService;
import vo.FacVO;


@WebServlet("/amenity.do")
public class Amenity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		�닾�몴�옄�닔
		String user = request.getParameter("fac_no");
		int star = Integer.parseInt(request.getParameter("star"));
		
		IFacService service = FacServiceImpl.getService();
		
		FacVO vo = new FacVO();
		
		vo.setFac_no(user);
		vo.setFac_sum(star);
		
		System.out.println("vo.setFac_no(user); : " + vo.getFac_no());
		System.out.println("vo.setFac_sum(star);" + vo.getFac_sum());
		
		//vo.setFac_no(fac_no);
//		vo.setMem_pass();
		
		//List<FacVO> list = service.updateScore();
		int res = service.updateScore(vo);
		
		System.out.println("res : " + res);
		
		//request.setAttribute("star", list);
		//request.setAttribute("userv", list);
		request.setAttribute("res", res);
		
		//request.getRequestDispatcher("hotel/star.jsp").forward(request,response);
		request.getRequestDispatcher("hotel/result.jsp").forward(request,response);
	}

}
