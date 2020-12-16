package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.QBoardVO;
import vo.QReplyVO;

/*
 * SqlMapClient 객체 얻어오기
 * 자신의 객체를 생성해서 리턴
 */
public class QBoardDaoImpl implements IQBoardDao{
	private SqlMapClient client;
	private static IQBoardDao dao;
	
	private QBoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQBoardDao getDao() {
		if(dao==null) dao = new QBoardDaoImpl();
		return dao;
	}

	@Override
	public List<QBoardVO> qbolistPage(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("qboard.qbolistPage", map);
	}

	@Override
	public int qbogetTotalCount() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.queryForObject("qboard.qbogetTotalCount");
	}

	@Override
	public int insertQBoard(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.insert("qboard.insertQBoard", qboVo);
	}
	@Override
	public int insertQBoard2(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.insert("qboard.insertQBoard2", qboVo);
	}

	@Override
	public int deleteQBoard(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("qboard.deleteQBoard", qboVo);
	}
	@Override
	public int deleteQBoard2(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("qboard.deleteQBoard2", qboVo);
	}

	@Override
	public int updateQBoard(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("qboard.updateQBoard", qboVo);
	}
	@Override
	public int updateQBoard2(QBoardVO qboVo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("qboard.updateQBoard2", qboVo);
	}
	

	

	@Override
	public List<QReplyVO> listQReply(int q_no) throws SQLException {
		return client.queryForList("qreply.listQReply", q_no);
	}

	@Override
	public int insertQReply(QReplyVO vo) throws SQLException {
		return (Integer)client.insert("qreply.insertQReply", vo);
	}

	@Override
	public int updateQReply(QReplyVO vo) throws SQLException {
		return client.update("qreply.updateQReply", vo);
	}

	@Override
	public int deleteQReply(int qre_no) throws SQLException {
		return client.delete("qreply.deleteQReply", qre_no);
	}




}
