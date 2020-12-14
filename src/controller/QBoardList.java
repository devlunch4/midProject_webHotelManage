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

import service.IQBoardService;
import service.QBoardServiceImpl;
import vo.QBoardVO;

/**
 * Servlet implementation class ReviewList
 */
@WebServlet("/QBoardList.do")
public class QBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이지별 리스트 가져오기
		
		// 0. page번호 가져오기
		int cpage = Integer.parseInt(request.getParameter("page"));
		
		// 1. service객체
		IQBoardService service = QBoardServiceImpl.getService();
		
		// 전체 글 갯수 가져오기
		int totalCount = service.qbogetTotalCount();
		
		// 한 페이지당 출력할 글 갯수
		int perList = 5;
		
		int start = (cpage-1) * perList + 1;
		//cpage = 1 -> 1
		//cpage = 2 -> 4
		//cpage = 3 -> 7
		int end = start + perList -1;
		//start 17 ~ 19 start = 20;
		if(end>totalCount) end = totalCount;
		
		//한 화면에  출력될 페이지 갯수
		int perPage = 3;
		int totalPage = (int)Math.ceil(totalCount / (double)perList);
		
		int startPage =((cpage -1) /perPage * perPage) +1;
		//cpage=1 -> 1 //cpage2 -> 1 //cpage=3 -> 3 //cpage=4 -> 3
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//2. 메서드 호출
		List<QBoardVO> list = service.qbolistPage(map);
		
		//3. 결과값 저장
		request.setAttribute("list", list);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		
		//4.
		request.getRequestDispatcher("hotel/qboListPage.jsp").forward(request, response);
	}

}
