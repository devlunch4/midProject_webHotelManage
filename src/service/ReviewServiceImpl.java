package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IReviewDao;
import dao.ReviewDaoImpl;
import vo.RevReplyVO;
import vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	private IReviewDao dao;
	private static IReviewService service;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getDao();
	}
	
	public static IReviewService getService() {
		if(service==null) service = new ReviewServiceImpl();
		
		return service;
	}
	
//	@Override
//	public List<ReviewVO> revlistAll() {
//		
//		List<ReviewVO> list = null;
//		
//		try {
//			list = dao.revlistAll();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
	
	@Override
	public List<ReviewVO> revlistPage(Map<String, Object> map) {
		
		List<ReviewVO> list = null;
		
		try {
			list = dao.revlistPage(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int revgetTotalCount() {
		int cnt = 0;
		
		try {
			cnt = dao.revgetTotalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public int insertReview(ReviewVO vo) {
		int rev_no = 0;
		
		try {
			rev_no = dao.insertReview(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rev_no;
	}
	
	@Override
	public int insertReview2(ReviewVO vo) {
		int rev_no = 0;
		
		try {
			rev_no = dao.insertReview2(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rev_no;
	}

	@Override
	public int deleteReview(ReviewVO revVo) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReview(revVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteReview2(ReviewVO revVo) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReview2(revVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public int updateReview(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateReview(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public int updateReview2(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateReview2(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public List<RevReplyVO> listRevReply(int rev_no) {
		List<RevReplyVO> list = null;
		
		try {
			list = dao.listRevReply(rev_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertRevReply(RevReplyVO vo) {
		int revrep_no = 0;
		
		try {
			revrep_no = dao.insertRevReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return revrep_no;
	}

	@Override
	public int updateRevReply(RevReplyVO vo) {
		int res=0;
		
		try {
			res=dao.updateRevReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteRevReply(int revrep_no) {
		int res = 0;
		
		try {
			res = dao.deleteRevReply(revrep_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
