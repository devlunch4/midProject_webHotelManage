package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.MemberInfoVO;
import vo.ResvlogVO;
import vo.RoomVO;
import vo.VoteVO;

public interface IHotelDao {

	// b1 예약로그테이블 리스트 가져오는 메서드
	public List<ResvlogVO> resvLogAllList() throws SQLException;

	// b1 예약로그테이블 상태 업데이트 메서드
	public int resvStatusUpdate(ResvlogVO vo) throws SQLException;

	// b2 호텔 지점 리스트 가져오는 메서드
	public List<RoomVO> getRoomPlList() throws SQLException;

	// b2 호텔 방종류 리스트 가져오는 메서드
	public List<RoomVO> getRoomTypeList(String room_pl) throws SQLException;

	// b2 호텔 방번호 가져오는 메서드
	public List<RoomVO> getRoomNo(Map<String, String> map) throws SQLException;

	// b1 아이디 중복 검사
	public String selectById(String id) throws SQLException;

	// b1 회원가입 인서트
	public String insertMember(MemberInfoVO vo) throws SQLException;

	// b3 직원 투표수 가져오기
	public int updateMemberVote(VoteVO vo) throws SQLException;

	// b3 직원 전체 정보 가져오기
	public List<VoteVO> votelistAll() throws SQLException;

	// 20201214 b2 관리자가 쓸 호텔 정보 가져오기
	public List<RoomVO> getRoomInfoList() throws SQLException;

	// 20201214 b2 관리자가 변경한 방 상태 업데이트
	public int updateRoomStatus(Map<String, Object> map) throws SQLException;
	
	// 20201215 b2 호텔방 추가하기
	public int insertRoom(Map<Object, Object> map) throws SQLException;
	
	// 20201215 b2 호텔방 삭제하기
	public int deleteRoom(Map<String, Object> map) throws SQLException;
}
