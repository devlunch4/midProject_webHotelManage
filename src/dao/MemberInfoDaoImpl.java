package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.MemberInfoVO;

public class MemberInfoDaoImpl implements IMemberInfoDao {

	private SqlMapClient client;

	private static IMemberInfoDao dao;

	private MemberInfoDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static IMemberInfoDao getDao() {
		if (dao == null)
			dao = new MemberInfoDaoImpl();
		return dao;
	}

	// 로그인을 위해 memberinfo테이블에서 id와 password가져오는 메서드 dao부분
	@Override
	public MemberInfoVO getMemberInfo(MemberInfoVO vo) throws SQLException {
		return (MemberInfoVO) client.queryForObject("memberinfo.getMemberInfo", vo);
	}

	// 20201213 b2 내정보 수정을 위해 값을 가져오기
	@Override
	public MemberInfoVO getMemberInfoVal(String mem_id) throws SQLException {
		return (MemberInfoVO) client.queryForObject("memberinfo.getMemberInfoVal", mem_id);
	}

	// 20201213 b2 내정부 수정
	@Override
	public int updateMemberInfo(MemberInfoVO vo) throws SQLException {
		return client.update("memberinfo.updateMemberInfo", vo);
	}

}
