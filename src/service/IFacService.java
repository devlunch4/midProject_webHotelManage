package service;

import java.util.List;

import vo.FacVO;



public interface IFacService {

	
	//public List<FacVO> updateScore();
	public int updateScore(FacVO vo);
	
	public List<FacVO> selectScoreAvg();

	public List<FacVO> selectByFac(int count);
}
