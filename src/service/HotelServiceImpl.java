package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.HotelDaoImpl;
import dao.IHotelDao;
import vo.MemberInfoVO;
import vo.ResvlogVO;
import vo.RoomVO;
import vo.VoteVO;

public class HotelServiceImpl implements IHotelService {
	private IHotelDao dao;
	private static IHotelService service;

	private HotelServiceImpl() {
		dao = HotelDaoImpl.getDao();
	}

	public static IHotelService getService() {
		if (service == null)
			service = new HotelServiceImpl();
		return service;
	}

	// b1 예약로그테이블 리스트 가져오는 메소드
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

	// b1 예약로그 상태 업데이트 (예약 >> 결제 또는 취소환불)
	@Override
	public int resvStatusUpdate(ResvlogVO vo) {

		int cnt = 0;
		try {
			cnt = dao.resvStatusUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// b2 호텔 지점 가져오는 메서드
	@Override
	public List<RoomVO> getRoomPlList() {

		List<RoomVO> list = null;

		try {
			list = dao.getRoomPlList();
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}

		return list;
	}

	// b2 방 종류 가져오는 메서드
	@Override
	public List<RoomVO> getRoomTypeList(String room_pl) {

		List<RoomVO> list = null;

		try {
			list = dao.getRoomTypeList(room_pl);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}

		return list;
	}

	// b2 방 번호 가져오는 메서드
	@Override
	public List<RoomVO> getRoomNo(Map<String, String> map) {

		List<RoomVO> list = null;

		try {
			list = dao.getRoomNo(map);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}

		return list;
	}

	// b1 회원 아이디 중복검사 > 입력값이 아이디 존재유무 확인
	@Override
	public String selectById(String id) {
		String resId = null;

		try {
			resId = dao.selectById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resId;
	}

	// b1 회원가입 인서트
	@Override
	public String insertMember(MemberInfoVO vo) {
		String cnt = null;
		try {
			cnt = dao.insertMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// b3 직원 투표 업데이트
	@Override
	public int updateMemberVote(VoteVO vo) {
		int cnt = 0;

		try {
			cnt = dao.updateMemberVote(vo);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return cnt;
	}

	// b3 직원 가져오기
	@Override
	public List<VoteVO> votelistAll() {
		List<VoteVO> list = null;

		try {
			list = dao.votelistAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 20201214 b2 관리자가 쓸 호텔 정보 가져오기
	@Override
	public List<RoomVO> getRoomInfoList() {
		List<RoomVO> list = null;

		try {
			list = dao.getRoomInfoList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 20201214 b2 관리자가 변경한 방 상태 업데이트
	@Override
	public int updateRoomStatus(Map<String, Object> map) {
		int res = 0;

		try {
			res = dao.updateRoomStatus(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	// 20201215 b2 관리자가 호텔방 추가
	@Override
	public int insertRoom(Map<Object, Object> map) {

		int res = 0;

		try {
			res = dao.insertRoom(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	// 20201215 b2 호텔방 삭제
	@Override
	public int deleteRoom(Map<String, Object> map) {

		int res = 0;

		try {
			res = dao.deleteRoom(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

}
