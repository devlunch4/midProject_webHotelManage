package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.NoticeVO;

public interface INoticeDao {
	
	// 전체 게시글 가져오기
//	public List<NoticeVO> nolistAll() throws SQLException;
	
	// 페이지별 게시글 가져오기
	public List<NoticeVO> nolistPage(Map<String, Object> map) throws SQLException;
	
	// 전체 글 갯수 가져오기
	public int getTotalCount() throws SQLException;
	
	// 게시글 등록
	public int insertNotice(NoticeVO notiVo) throws SQLException;
	
	// 게시글 삭제
	public int deleteNotice(int noti_no) throws SQLException;
	
	// 게시글 수정
	public int updateNotice(NoticeVO notiVo) throws SQLException;
	

}
