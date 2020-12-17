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

	// 20201215 b2 회원 정보 가져오기
	@Override
	public List<MemberInfoVO> getMemberInfoList() throws SQLException {
		return client.queryForList("memberinfo.getMemberInfoList");
	}

	// 20201215 b2  관리자가 회원정보 수정하는 부분
	@Override
	public int adminMemberInfoUpdate(MemberInfoVO vo) throws SQLException {

		int res = client.update("memberinfo.MemberInfoUpdate", vo);
		System.out.println("update 한 후 res 값 : " + res);
		if (res > 0)
			res = 1;
		else
			res = 0;
		System.out.println("return 전 res 값 : " + res);

		return res;
	}

	// 20201215 b2 관리자가 회원추가하는거
	@Override
	public int adminInsertMember(MemberInfoVO vo) throws SQLException {

		vo = (MemberInfoVO) client.insert("memberinfo.insertMember", vo);
		int res = 0;
		if (vo == null)
			res = 1;
		else
			res = 0;

		System.out.println("return 전 res 값 : " + res);

		return res;
	}

	// 20201215 b2 관리자가 회원 정보 삭제
	@Override
	public int deleteMember(String mem_id) throws SQLException {
		return client.delete("memberinfo.deleteMember", mem_id);
	}
	
	// 20201215 id찾기
	@Override
	public String getMemberId(MemberInfoVO vo) throws SQLException {
		return (String) client.queryForObject("memberinfo.getMemberId", vo);
	}
	
	// 20201215 비밀번호 찾기
	@Override
	public String getMemberPassWord(MemberInfoVO vo) throws SQLException {
		return (String) client.queryForObject("memberinfo.getMemberPassword", vo);
	}
	
	// 20201217 회원 탈퇴시 권한 변경
	@Override
	public int updateMemberWithdraw(String mem_id) throws SQLException {
		return client.update("memberinfo.updateMemberWithdraw", mem_id);
	}
	
}
