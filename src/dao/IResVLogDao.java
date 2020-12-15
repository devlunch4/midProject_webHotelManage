package dao;

import java.sql.SQLException;
import java.util.List;

import vo.ResvlogVO;

public interface IResVLogDao {

	// re 20201213 b2 예약 등록 메서드
	public int insertResVLog(ResvlogVO vo) throws SQLException;

	// 20201213 b2 예약 정보 리스트 가져오기
	public List<ResvlogVO> getresvLogAllList(String mem_id) throws SQLException;

	// 20201215 b2 년월매출 검색해서 가져오기
	public List<ResvlogVO> getResvlogDateMoney(String resev_date) throws SQLException;
}
