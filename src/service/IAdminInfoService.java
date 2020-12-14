package service;

import java.util.List;

import vo.AdminInfoVO;

public interface IAdminInfoService {
	
	// 관리자 로그인하기 위해 조회
	public AdminInfoVO getAdminInfo(AdminInfoVO vo);

}
