package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.AdminInfoVO;

public class AdminInfoDaoImpl implements IAdminInfoDao {
	
	private SqlMapClient client;
	private static IAdminInfoDao dao;
	
	private AdminInfoDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IAdminInfoDao getDao() {
		if (dao == null) dao = new AdminInfoDaoImpl();
		return dao;
	}
	
	
	// 관리자 로그인 하기 위해 조회
	@Override
	public AdminInfoVO getAdminInfo(AdminInfoVO vo) throws SQLException {
		return (AdminInfoVO) client.queryForObject("admininfo.getAdminInfo", vo);
	}
	
	
	
}
