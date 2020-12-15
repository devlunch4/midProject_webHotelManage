package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.QBoardVO;
import vo.QReplyVO;

public interface IQBoardService {


	// 페이지별 게시글 가져오기
	public List<QBoardVO> qbolistPage(Map<String, Object> map);
	
	// 전체 글 갯수 가져오기
	public int qbogetTotalCount();
	
	// 게시글 등록
	public int insertQBoard(QBoardVO qboVo);
	
	// 게시글 삭제
	public int deleteQBoard(QBoardVO qboVo);
	
	// 게시글 수정
	public int updateQBoard(QBoardVO qboVo);
	
	
	// 댓글 리스트
	public List<QReplyVO> listQReply(int q_no);
	
	// 댓글 등록
	public int insertQReply(QReplyVO vo);
	
	// 댓글 수정
	public int updateQReply(QReplyVO vo);
	
	// 댓글 삭제
	public int deleteQReply(int qre_no);
	
}
