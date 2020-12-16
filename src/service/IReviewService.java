package service;

import java.util.List;
import java.util.Map;

import vo.RevReplyVO;
import vo.ReviewVO;

public interface IReviewService {

	// 전체 게시글 가져오기
//	public List<ReviewVO> revlistAll();
	
	// 페이지별 게시글 가져오기
	public List<ReviewVO> revlistPage(Map<String, Object> map);
	
	// 전체 글 갯수 가져오기
	public int revgetTotalCount();
	
	// 게시글 등록
	public int insertReview(ReviewVO revVo);
	// 관리자 게시글 등록
	public int insertReview2(ReviewVO revVo);
	
	// 게시글 삭제
	public int deleteReview(ReviewVO revVo);
	// 관리자 게시글 삭제
	public int deleteReview2(ReviewVO revVo);
	
	// 게시글 수정
	public int updateReview(ReviewVO revVo);
	// 관리자 게시글 수정
	public int updateReview2(ReviewVO revVo);
	
	
	// 댓글 리스트
	public List<RevReplyVO> listRevReply(int rev_no);
	
	// 댓글 등록
	public int insertRevReply(RevReplyVO vo);
	
	// 댓글 수정
	public int updateRevReply(RevReplyVO vo);
	
	// 댓글 삭제
	public int deleteRevReply(int revrep_no);
		
}
