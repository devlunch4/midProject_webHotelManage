package service;

import java.sql.SQLException;
import java.util.List;

import dao.AdminInfoDaoImpl;
import dao.IAdminInfoDao;
import vo.AdminInfoVO;

public class AdminInfoServiceImpl implements IAdminInfoService{
	
	private IAdminInfoDao dao;
	private static IAdminInfoService service;
	
	private AdminInfoServiceImpl() {
		dao = AdminInfoDaoImpl.getDao();
	}
	
	public static IAdminInfoService getService() {
		if (service == null) service = new AdminInfoServiceImpl();
		return service;
	}
	
	// 관리자 로그인하기 위한 부분
	@Override
	public AdminInfoVO getAdminInfo(AdminInfoVO vo) {
		
		AdminInfoVO vp = null;
		
		try {
			vp = (AdminInfoVO) dao.getAdminInfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vp;
	}
	
	
	
	
	
}
