package dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.ResvlogVO;

public class ResVLogDaoImpl implements IResVLogDao{
	
	private SqlMapClient client;
	private static IResVLogDao dao;
	
	private ResVLogDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IResVLogDao getDao() {
		if(dao==null) dao = new ResVLogDaoImpl();
		return dao;
	}
	
	// 예약 등록
	@Override
	public int insertResVLog(ResvlogVO vo) throws SQLException {
		return (int) client.insert("resvlog.insertResVLog", vo);
	}

}
