package dao;

import java.sql.SQLException;
import java.util.List;

import vo.MemberInfoVO;

public interface IMemberInfoDao {

	// 로그인할때 회원이 맞는지 체크하기 위해 값 조회하는 메서드 dao부분
	public MemberInfoVO getMemberInfo(MemberInfoVO vo) throws SQLException;

	//20201213 b2 내정보 수정을 위해 값 가져오기
	public MemberInfoVO getMemberInfoVal(String mem_id) throws SQLException;

	// 20201213 내정보 수정
	public int updateMemberInfo(MemberInfoVO vo) throws SQLException;

}
