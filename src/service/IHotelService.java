package service;

import java.util.List;

import vo.ResvlogVO;

public interface IHotelService {

	public List<ResvlogVO> resvLogAllList();
	
	public int resvStatusUpdate(ResvlogVO vo);
}
