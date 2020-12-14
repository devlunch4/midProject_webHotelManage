package dao;

import java.sql.SQLException;
import java.util.List;

import vo.AdminInfoVO;

public interface IAdminInfoDao {
	
	// 관리자 로그인하기 위해 조회
	public AdminInfoVO getAdminInfo(AdminInfoVO vo) throws SQLException;

}
