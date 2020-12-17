package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.RevReplyVO;
import vo.ReviewVO;

/*
 * SqlMapClient 객체 얻어오기
 * 자신의 객체를 생성해서 리턴
 */
public class ReviewDaoImpl implements IReviewDao{
	private SqlMapClient client;
	private static IReviewDao dao;
	
	private ReviewDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IReviewDao getDao() {
		if(dao==null) dao = new ReviewDaoImpl();
		return dao;
	}
	
//	@Override
//	public List<ReviewVO> revlistAll() throws SQLException{
//
//		return client.queryForList("reviewboard.revlistAll");
//	}
	
	@Override
	public List<ReviewVO> revlistPage(Map<String, Object> map) throws SQLException{
		
		return client.queryForList("reviewboard.revlistPage", map);
	}
	
	@Override
	public int revgetTotalCount() throws SQLException {
		
		return (Integer)client.queryForObject("reviewboard.revgetTotalCount");
	}
	
	@Override
	public int insertReview(ReviewVO revVo) throws SQLException {
		
		return (Integer)client.insert("reviewboard.insertReview", revVo);
	}
	@Override
	public int insertReview2(ReviewVO revVo) throws SQLException {
		
		return (Integer)client.insert("reviewboard.insertReview2", revVo);
	}

	@Override
	public int deleteReview(ReviewVO revVo) throws SQLException {
		
		return client.delete("reviewboard.deleteReview", revVo);
	}
	@Override
	public int deleteReview2(ReviewVO revVo) throws SQLException {
		
		return client.delete("reviewboard.deleteReview2", revVo);
	}

	@Override
	public int updateReview(ReviewVO revVo) throws SQLException {
		
		return client.update("reviewboard.updateReview", revVo);
	}
	@Override
	public int updateReview2(ReviewVO revVo) throws SQLException {
		
		return client.update("reviewboard.updateReview2", revVo);
	}

	@Override
	public List<RevReplyVO> listRevReply(int rev_no) throws SQLException {
		return client.queryForList("reviewreply.listRevReply", rev_no);
	}

	@Override
	public int insertRevReply(RevReplyVO vo) throws SQLException {
		return (Integer)client.insert("reviewreply.insertRevReply", vo);
	}

	@Override
	public int updateRevReply(RevReplyVO vo) throws SQLException {
		return client.update("reviewreply.updateRevReply", vo);
	}

	@Override
	public int deleteRevReply(int revrep_no) throws SQLException {
		return client.delete("reviewreply.deleteRevReply", revrep_no);
	}




}
