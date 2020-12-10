package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.ResvlogVO;

public class HotelDaoImpl implements IHotelDao {
	// 1�� ��ü ����
	private SqlMapClient client;
	private static IHotelDao dao;

	private HotelDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	// �ڽ��� ��ü ���� ����
	public static IHotelDao getDao() {
		if(dao == null) dao = new HotelDaoImpl();
		return dao;
	}

	@Override
	public List<ResvlogVO> resvLogAllList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("resvlog.resvLogAllList");
	}

	@Override
	public int resvStatusUpdate(ResvlogVO vo) throws SQLException {
		return client.update("resvlog.resvLogUpdate", vo);
	}

}
