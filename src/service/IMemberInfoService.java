package service;

import java.util.List;

import vo.MemberInfoVO;

public interface IMemberInfoService {
	
	// b2 로그인할때 회원이 맞는지 체크하기 위해 값 조회하는 메서드 서비스 부분
	public MemberInfoVO getMemberInfo(MemberInfoVO vo);
	
	// 20201213 b2 내정보 수정을 위해 값 가져오기
	public MemberInfoVO getMemberInfoVal(String mem_id);
	
	// 20201213 b2 내정보 수정
	public int updateMemberInfo(MemberInfoVO vo);
	
	// 20201215 b2 회원정보 가져오기
	public List<MemberInfoVO> getMemberInfoList();
	
	// 20201215 b2 관리자가 회원정보 수정
	public int adminMemberInfoUpdate(MemberInfoVO vo);
	
	// 20201215 b2 관리자가 회원정보 등록
	public int adminInsertMember(MemberInfoVO vo);
	
	// 20201215 b2 관리자가 회원정보 삭제
	public int deleteMember(String mem_id);
	
	// 20201215 id 찾기
	public String getMemberId(MemberInfoVO vo);
	
	// 20201215 비밀번호 찾기
	public String getMemberPassWord(MemberInfoVO vo);
	
	// 20201217 회원 탈퇴시 권환변경	
	public int updateMemberWithdraw(String mem_id);
	
}
