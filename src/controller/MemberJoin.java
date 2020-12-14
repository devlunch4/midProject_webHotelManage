package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HotelServiceImpl;
import service.IHotelService;
import vo.MemberInfoVO;

/**
 * Servlet implementation class MemberJoin
 */
@WebServlet("/memberJoin.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberJoin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// b1 회원가입 인서트
		System.out.println();
		System.out.println("000");
		System.out.println();
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("mem_idx");
		String name = request.getParameter("mem_name");
		String pass = request.getParameter("mem_pass");
		String email = request.getParameter("mem_email");
		String bir = request.getParameter("mem_bir");
		String hp = request.getParameter("mem_hp");
		String zip = request.getParameter("mem_zip");
		String add1 = request.getParameter("mem_add1");
		String add2 = request.getParameter("mem_add2");
		String add3 = add1 + " " + add2;
		String power = "0";
		
		
		MemberInfoVO vo = new MemberInfoVO();

		vo.setMem_pass(pass);
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_email(email);
		vo.setMem_bir(bir);
		vo.setMem_tel(hp);
		vo.setMem_addr(add3);
		vo.setPower(power);

		System.out.println("111");
		// 1 서비스 객체 얻기
		IHotelService service = HotelServiceImpl.getService();

		// 2 service 메소드 호출. 결과 받기
		String resId = service.insertMember(vo);

		// 컨트롤러>서비스>다오>서비스>컨드롤러

		// 3 결과값 저장.
		request.setAttribute("resId", resId);
		System.out.println(resId + "멤버 조인");

		// 결과 출력 또는 json 생성
		request.getRequestDispatcher("hotel/joinres.jsp").forward(request, response);

		//주소 이메일 api로 보내기
		new SendMailTest(email);
		 
		System.out.println();
		System.out.println("회원가입 정보 인서트 완료~");
		System.out.println();
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
