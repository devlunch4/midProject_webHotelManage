package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.ResvlogVO;
import vo.RoomVO;

public class HotelDaoImpl implements IHotelDao {
	
	private SqlMapClient client;
	private static IHotelDao dao;

	private HotelDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	
	public static IHotelDao getDao() {
		if(dao == null) dao = new HotelDaoImpl();
		return dao;
	}

	// b1 예약로그테이블 리스트 가져오는 메서드
	@Override
	public List<ResvlogVO> resvLogAllList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("resvlog.resvLogAllList");
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
			return (String) client.queryForObject("memberinfo.selectById",id);
		}

}
