package service;

import vo.ResvlogVO;


//b2 예약로그테이블 인서트부분 예약시 테이블에 값 등록
public interface IResVLogService {
	
	public int insertResVLog(ResvlogVO vo);

}
