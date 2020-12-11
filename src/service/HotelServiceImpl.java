package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.HotelDaoImpl;
import dao.IHotelDao;
import vo.ResvlogVO;
import vo.RoomVO;

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
	
	

	//b1 예약로그테이블 리스트 가져오는 메소드
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

	
	
	//  b2 호텔 지점 가져오는 메서드
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

		//b1 회원 아이디 중복검사 > 입력값이 아이디 존재유무 확인
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
		
		

}
