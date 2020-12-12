package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.MemberInfoVO;

public class MemberInfoDaoImpl implements IMemberInfoDao{
	
	private SqlMapClient client; 
	
	private static IMemberInfoDao dao;
	
	private MemberInfoDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberInfoDao getDao() {
		if(dao==null) dao = new MemberInfoDaoImpl();
		return dao;
	}
	
	// 로그인을 위해 memberinfo테이블에서 id와 password가져오는 메서드 dao부분
	@Override
	public MemberInfoVO getMemberInfo(MemberInfoVO vo) throws SQLException {
		return (MemberInfoVO) client.queryForObject("memberinfo.getMemberInfo", vo);
	}
	
	
	
	
	
	
	
	
	
}
