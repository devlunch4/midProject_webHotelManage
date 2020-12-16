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

	// 20201215 b2 회원 정보 가져오기
	@Override
	public List<MemberInfoVO> getMemberInfoList() {

		List<MemberInfoVO> list = null;

		try {
			list = dao.getMemberInfoList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 20201215 b2 관리자가 회원정보 수정하는거
	@Override
	public int adminMemberInfoUpdate(MemberInfoVO vo) {

		int res = 0;

		try {
			res = dao.adminMemberInfoUpdate(vo);
			System.out.println("service의 res 값 : " + res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("service의 return전 res 값 : " + res);
		return res;
	}

	// 20201215 b2 관리자가 회원추가
	@Override
	public int adminInsertMember(MemberInfoVO vo) {

		int res = 0;

		try {
			res = dao.adminInsertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	// 20201215 b2 관리자가 회원 삭제
	@Override
	public int deleteMember(String mem_id) {

		int res = 0;

		try {
			res = dao.deleteMember(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	// 20201215 id찾기
	@Override
	public String getMemberId(MemberInfoVO vo) {

		String memId = null;

		try {
			memId = dao.getMemberId(vo);
			System.out.println("serviceImpl 부분 memId 값 : " + memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memId;
	}

	// 20201215 비밀번호 찾기
	@Override
	public String getMemberPassWord(MemberInfoVO vo) {
		String memPass = null;

		try {
			memPass = dao.getMemberPassWord(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memPass;
	}

}
