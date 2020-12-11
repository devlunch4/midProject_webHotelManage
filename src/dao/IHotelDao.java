package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.MemberInfoVO;
import vo.ResvlogVO;
import vo.RoomVO;

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
	
	//b1 회원가입 인서트
	public String insertMember(MemberInfoVO vo) throws SQLException;
}
