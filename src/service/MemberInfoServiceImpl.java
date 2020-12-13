package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IMemberInfoDao;
import dao.MemberInfoDaoImpl;
import vo.MemberInfoVO;

public class MemberInfoServiceImpl implements IMemberInfoService {

	private IMemberInfoDao dao;
	private static IMemberInfoService service;

	private MemberInfoServiceImpl() {
		dao = MemberInfoDaoImpl.getDao();
	}

	public static IMemberInfoService getService() {
		if (service == null)
			service = new MemberInfoServiceImpl();
		return service;
	}

	// b2 로그인을 위해 memberinfo테이블에서 id와 password가져오는 메서드 서비스 부분
	@Override
	public MemberInfoVO getMemberInfo(MemberInfoVO vo) {

		MemberInfoVO vp = null;

		try {
			vo = dao.getMemberInfo(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// 20201213 합 b2 내정보 수정하기 위해 내정보를 가져옴
	@Override
	public MemberInfoVO getMemberInfoVal(String mem_id) {

		MemberInfoVO vo = null;

		try {
			vo = dao.getMemberInfoVal(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// 20201213 합 b2내정보 수정
	@Override
	public int updateMemberInfo(MemberInfoVO vo) {

		int res = 0;

		try {
			res = dao.updateMemberInfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

}
