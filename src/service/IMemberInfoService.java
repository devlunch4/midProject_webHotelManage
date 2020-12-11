package service;

import java.util.List;

import vo.MemberInfoVO;

public interface IMemberInfoService {
	
	// b2 로그인할때 회원이 맞는지 체크하기 위해 값 조회하는 메서드 서비스 부분
	public List<MemberInfoVO> getMemberInfo(MemberInfoVO vo);
	
}
