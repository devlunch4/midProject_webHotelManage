package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.MemberInfoVO;
import vo.ResvlogVO;
import vo.RoomVO;
import vo.VoteVO;

public class HotelDaoImpl implements IHotelDao {

	private SqlMapClient client;
	private static IHotelDao dao;

	private HotelDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static IHotelDao getDao() {
		if (dao == null)
			dao = new HotelDaoImpl();
		return dao;
	}

	// b1 예약로그테이블 리스트 가져오는 메서드
	@Override
	public List<ResvlogVO> resvLogAllList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("resvlog.getresvLogAllList2");
	}

	// b1 예약로그테이블 상태 업데이트 메서드
	@Override
	public int resvStatusUpdate(ResvlogVO vo) throws SQLException {
		return client.update("resvlog.resvLogUpdate", vo);
	}

	// b2 호텔 지점 가져오는 sql 처리 메서드
	@Override
	public List<RoomVO> getRoomPlList() throws SQLException {
		return client.queryForList("room.getRoomPl");
	}

	// b2 호텔 지점 방 종류 가져오는 sql 처리 메서드
	@Override
	public List<RoomVO> getRoomTypeList(String room_pl) throws SQLException {
		return client.queryForList("room.getRoomType", room_pl);
	}

	// b2 호텔 지점 방 종류의 방번호 가져오는 sql 처리 메서드
	@Override
	public List<RoomVO> getRoomNo(Map<String, String> map) throws SQLException {
		return (List<RoomVO>) client.queryForList("room.getRoomNo", map);
	}

	// b1 아이디 중복 검사
	@Override
	public String selectById(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("memberinfo.selectById", id);
	}

	// b1 회원가입 넣기
	@Override
	public String insertMember(MemberInfoVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.insert("memberinfo.insertMember", vo);
	}

	// b3 직원 투표 업
	@Override
	public int updateMemberVote(VoteVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) client.update("memberVote.updateMemberVote", vo);
	}

	// b3 직원 리스트 불러오기
	@Override
	public List<VoteVO> votelistAll() throws SQLException {

		return client.queryForList("memberVote.votelistAll");
	}

	// 20201214 b2 관리자가 쓸 호텔 정보 가져오기
	@Override
	public List<RoomVO> getRoomInfoList() throws SQLException {
		return client.queryForList("room.getRoomInfoList");
	}

	// 20201214 b2 관리자가 변경한 방 상태 업데이트
	@Override
	public int updateRoomStatus(Map<String, Object> map) throws SQLException {
		return client.update("room.updateRoomStatus", map);
	}

	// 20201215 b2 관리자가 호텔 방 추가
	@Override
	public int insertRoom(Map<Object, Object> map) throws SQLException {

		int res = 0;

		map = (Map<Object, Object>) client.insert("room.insertRoom", map);

		if (map == null) {
			res = 1;
			System.out.println("dao에 있는 if의 res 값" + res);
		} else {
			res = 0;
			System.out.println("dao에 있는 else의 res 값" + res);
		}

		return res;

		// return client.insert("room.insertRoom", map);
	}

	// 20201215 b2 호텔방 삭제
	@Override
	public int deleteRoom(Map<String, Object> map) throws SQLException {

		int res = 0;

		map = (Map<String, Object>) client.insert("room.deleteRoom", map);

		if (map == null) {
			res = 1;
			System.out.println("dao에 있는 if의 res 값" + res);
		} else {
			res = 0;
			System.out.println("dao에 있는 else의 res 값" + res);
		}

		return res;
	}

}
