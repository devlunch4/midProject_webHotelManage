package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IMemberInfoDao;
import dao.MemberInfoDaoImpl;
import vo.MemberInfoVO;

public class MemberInfoServiceImpl implements IMemberInfoService{
	
	private IMemberInfoDao dao;
	private static IMemberInfoService service;
	
	private MemberInfoServiceImpl() {
		dao = MemberInfoDaoImpl.getDao();
	}
	
	public static IMemberInfoService getService() {
		if(service==null) service = new MemberInfoServiceImpl();
		return service;
	}
	
	// b2 로그인을 위해 memberinfo테이블에서 id와 password가져오는 메서드 서비스 부분
	@Override
	public List<MemberInfoVO> getMemberInfo(MemberInfoVO vo) {
		
		List<MemberInfoVO> list = null;
		
		try {
			list = dao.getMemberInfo(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	


	

}
