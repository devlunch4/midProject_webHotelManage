package service;

import java.sql.SQLException;
import java.util.List;

import dao.FacDaoImpl;
import dao.IFacDao;
import vo.FacVO;

public class FacServiceImpl implements IFacService {

	private IFacDao dao;
	private static IFacService service;
	
	private FacServiceImpl() {
		dao = FacDaoImpl.getDao();
	}

	public static IFacService getService() {
		if(service==null) service = new FacServiceImpl();
		return service;
	}
	
	@Override
	//public List<FacVO> updateScore() {
	public int updateScore(FacVO vo) {
		//List<FacVO> list = null;
		
		int res = 0;
		
		try {
			res = (Integer) dao.updateScore(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public List<FacVO> selectScoreAvg() {
		
		List<FacVO> list = null;
		
		try {
			list = dao.selectScoreAvg();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<FacVO> selectByFac(int count) {
		// TODO Auto-generated method stub
		return null;
	}

}
