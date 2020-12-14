package dao;

import java.sql.SQLException;
import java.util.List;

import vo.FacVO;

public interface IFacDao {
	
	//遺����떆�꽕 蹂꾩젏 �뵒鍮꾩뿉 媛� �꽔湲� 
	//public List<FacVO> updateScore()throws SQLException;
	public int updateScore(FacVO vo)throws SQLException;
	
	public List<FacVO> selectScoreAvg() throws SQLException;
	
	// 遺����떆�꽕 蹂꾩젏 �뵒鍮꾩뿉�꽌 媛��졇�삩寃� �솕硫댁뿉 �몴�떆
	public List<FacVO> selectByFac(int count) throws SQLException;
}
