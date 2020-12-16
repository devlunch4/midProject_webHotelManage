package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.RevReplyVO;
import vo.ReviewVO;

public interface IReviewDao {
	
	// 전체 게시글 가져오기
//	public List<ReviewVO> revlistAll() throws SQLException;
	
	// 페이지별 게시글 가져오기
	public List<ReviewVO> revlistPage(Map<String, Object> map) throws SQLException;
	
	// 전체 글 갯수 가져오기
	public int revgetTotalCount() throws SQLException;
	
	// 게시글 등록
	public int insertReview(ReviewVO revVo) throws SQLException;
	// 관리자 게시글 등록
	public int insertReview2(ReviewVO revVo) throws SQLException;
	
	// 게시글 삭제
	public int deleteReview(ReviewVO revVo) throws SQLException;
	// 관리자 게시글 삭제
	public int deleteReview2(ReviewVO revVo) throws SQLException;
	
	// 게시글 수정
	public int updateReview(ReviewVO revVo) throws SQLException;
	// 관리자 게시글 수정
	public int updateReview2(ReviewVO revVo) throws SQLException;
	
	
	
	// 댓글 리스트
	public List<RevReplyVO> listRevReply(int rev_no) throws SQLException;
	
	// 댓글 등록
	public int insertRevReply(RevReplyVO vo) throws SQLException;
	
	// 댓글 수정
	public int updateRevReply(RevReplyVO vo) throws SQLException;
	
	// 댓글 삭제
	public int deleteRevReply(int revrep_no) throws SQLException;
	
}
