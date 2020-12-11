package service;

import java.util.List;
import java.util.Map;

import vo.MemberInfoVO;
import vo.ResvlogVO;
import vo.RoomVO;

public interface IHotelService {

	// b1 예약로그테이블 리스트 가져오는 메서드
	public List<ResvlogVO> resvLogAllList();

	// b1 예약로그테이블 상태 업데이트 메서드
	public int resvStatusUpdate(ResvlogVO vo);

	// b2 호텔 지점 리스트 가져오는 메서드
	public List<RoomVO> getRoomPlList();

	// b2 호텔 방종류 리스트 가져오는 메서드
	public List<RoomVO> getRoomTypeList(String room_pl);

	// b2 호텔 방번호 가져오는 메서드
	public List<RoomVO> getRoomNo(Map<String, String> map);

	// b1 아이디 중복 검사
	public String selectById(String id);
	
	//b1 회원가입 인서트
	public int insertMember(MemberInfoVO vo);
	

}
