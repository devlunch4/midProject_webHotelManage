package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.ResvlogVO;

public class ResVLogDaoImpl implements IResVLogDao {

	private SqlMapClient client;
	private static IResVLogDao dao;

	private ResVLogDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static IResVLogDao getDao() {
		if (dao == null)
			dao = new ResVLogDaoImpl();
		return dao;
	}

	// 20201213 b2 예약 등록
	@Override
	public int insertResVLog(ResvlogVO vo) throws SQLException {
		return (int) client.insert("resvlog.insertResVLog", vo);
	}

	// 20201213 b2 유저가 예약한 정보 가져오기
	@Override
	public List<ResvlogVO> getresvLogAllList(String mem_id) throws SQLException {
		return (List<ResvlogVO>) client.queryForList("resvlog.getresvLogAllList", mem_id);
	}

	// 202011215 b2 년월매출 조회해서 가져오기
	@Override
	public List<ResvlogVO> getResvlogDateMoney(String resev_date) throws SQLException {
		return client.queryForList("resvlog.getResvlogDateMoney", resev_date);
	}

}
