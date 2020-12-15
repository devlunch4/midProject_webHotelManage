package service;

import java.sql.SQLException;
import java.util.List;

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
	
	// b2 20201213 추가 확인 유저가 예약한 정보 가져오기
	@Override
	public List<ResvlogVO> getresvLogAllList(String mem_id) {
		
		List<ResvlogVO> list = null;
		
		try {
			list = dao.getresvLogAllList(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 20201215 b2 년월매출 가져오는 메서드
	@Override
	public List<ResvlogVO> getResvlogDateMoney(String resev_date) {
		
		List<ResvlogVO> list = null;
		
		try {
			list = dao.getResvlogDateMoney(resev_date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


}
