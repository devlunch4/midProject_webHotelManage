package dao;

import java.sql.SQLException;
import java.util.List;

import vo.ResvlogVO;

public interface IHotelDao {
	public List<ResvlogVO> resvLogAllList() throws SQLException;
	
	public int resvStatusUpdate(ResvlogVO vo) throws SQLException;
}
