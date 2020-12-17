package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.NoticeVO;

/*
 * SqlMapClient 객체 얻어오기
 * 자신의 객체를 생성해서 리턴
 */
public class NoticeDaoImpl implements INoticeDao{
	private SqlMapClient client;
	private static INoticeDao dao;
	
	private NoticeDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeDao getDao() {
		if(dao==null) dao = new NoticeDaoImpl();
		return dao;
	}
	
//	@Override
//	public List<NoticeVO> nolistAll() throws SQLException{

//		return client.queryForList("noticeboard.nolistAll");
//	}
	
	@Override
	public List<NoticeVO> nolistPage(Map<String, Object> map) throws SQLException{
		
		return client.queryForList("noticeboard.nolistPage", map);
	}
	
	@Override
	public int getTotalCount() throws SQLException{
		
		return (Integer)client.queryForObject("noticeboard.nogetTotalCount");
	}
	
	@Override
	public int insertNotice(NoticeVO notiVo) throws SQLException {
		
		return (Integer)client.insert("noticeboard.insertNotice", notiVo);
	}

	@Override
	public int deleteNotice(int noti_no) throws SQLException {
		
		return client.delete("noticeboard.deleteNotice", noti_no);
	}

	@Override
	public int updateNotice(NoticeVO notiVo) throws SQLException {
		
		return client.update("noticeboard.updateNotice", notiVo);
	}

	




}
