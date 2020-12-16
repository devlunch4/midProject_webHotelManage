package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import service.IMemberInfoService;
import service.MemberInfoServiceImpl;
import vo.MemberInfoVO;

/**
 * Servlet implementation class MemberJoin
 */
@WebServlet("/FindId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 값 받아오는곳
		String name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		
		
		MemberInfoVO vo = new MemberInfoVO();

		vo.setMem_name(name);
		vo.setMem_email(email);

		// 1 서비스 객체 얻기
		IMemberInfoService service = MemberInfoServiceImpl.getService();

		// 2 service 메소드 호출. 결과 받기
		String memId = service.getMemberId(vo);
		int res = 0;
		if(memId != null) res =  1; 
		// 컨트롤러>서비스>다오>서비스>컨드롤러

		// 3 결과값 저장.
		request.setAttribute("res", res);
		vo.setMem_id(memId);

		// 결과 출력 또는 json 생성
		request.getRequestDispatcher("hotel/result.jsp").forward(request, response);

		//주소 이메일 api로 보내기
		new SendMailFindId(vo);
		 
		System.out.println();
		System.out.println("아이디 찾기 정보  완료~");
		System.out.println();
		
	}

}
