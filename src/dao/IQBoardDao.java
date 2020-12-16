package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.QBoardVO;
import vo.QReplyVO;

public interface IQBoardDao {
	
	
	// 페이지별 게시글 가져오기
	public List<QBoardVO> qbolistPage(Map<String, Object> map) throws SQLException;
	
	// 전체 글 갯수 가져오기
	public int qbogetTotalCount() throws SQLException;
	
	// 게시글 등록
	public int insertQBoard(QBoardVO qboVo) throws SQLException;
	// 관리자 게시글 등록
	public int insertQBoard2(QBoardVO qboVo) throws SQLException;
	
	// 게시글 삭제
	public int deleteQBoard(QBoardVO qboVo) throws SQLException;
	public int deleteQBoard2(QBoardVO qboVo) throws SQLException;
	
	// 게시글 수정
	public int updateQBoard(QBoardVO qboVo) throws SQLException;
	public int updateQBoard2(QBoardVO qboVo) throws SQLException;
	
	
	
	// 댓글 리스트
	public List<QReplyVO> listQReply(int q_no) throws SQLException;
	
	// 댓글 등록
	public int insertQReply(QReplyVO vo) throws SQLException;
	
	// 댓글 수정
	public int updateQReply(QReplyVO vo) throws SQLException;
	
	// 댓글 삭제
	public int deleteQReply(int qre_no) throws SQLException;
	
}
