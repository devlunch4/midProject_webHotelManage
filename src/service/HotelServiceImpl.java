package service;

import java.sql.SQLException;
import java.util.List;

import dao.HotelDaoImpl;
import dao.IHotelDao;
import vo.ResvlogVO;

public class HotelServiceImpl implements IHotelService {
	private IHotelDao dao;
	private static IHotelService service;
	
	private HotelServiceImpl() {
		dao = HotelDaoImpl.getDao();
	}
	
	public static IHotelService getService() {
		if(service == null)
			service = new HotelServiceImpl();
		return service;
	}
	
	@Override
	public List<ResvlogVO> resvLogAllList() {
		
		List<ResvlogVO> list = null;
		
		try {
			list = dao.resvLogAllList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int resvStatusUpdate(ResvlogVO vo) {
		// 수행건수 반환
		int cnt = 0;
		try {
			cnt = dao.resvStatusUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
