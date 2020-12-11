package service;

import java.sql.SQLException;

import dao.IResVLogDao;
import dao.ResVLogDaoImpl;
import vo.ResvlogVO;



public class ResVLogServiceImpl implements IResVLogService{
	
	private IResVLogDao dao;
	private static IResVLogService service;
	
	private ResVLogServiceImpl() {
		dao = ResVLogDaoImpl.getDao();
	}
	
	public static IResVLogService getService() {
		if(service==null) service = new ResVLogServiceImpl();
		return service;
	}
	
	// b2 예약 등록
	@Override
	public int insertResVLog(ResvlogVO vo) {
		
		int res = 0;
		
		try {
			res = dao.insertResVLog(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}


}
