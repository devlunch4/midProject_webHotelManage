package service;

import java.util.List;

import vo.ResvlogVO;

//b2 예약로그테이블 인서트부분 예약시 테이블에 값 등록
public interface IResVLogService {

	// 20201213 b2 예약 정보 등록
	public int insertResVLog(ResvlogVO vo);

	// 20201213 b2 예약 정보 리스트 가져오기
	public List<ResvlogVO> getresvLogAllList(String mem_id);

	// 20201215 b2 년월매출 검색해서 가져오기
	public List<ResvlogVO> getResvlogDateMoney(String resev_date);
}
