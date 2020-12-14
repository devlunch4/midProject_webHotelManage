package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.config.SqlMapClientFactory;
import vo.FacVO;

public class FacDaoImpl implements IFacDao{
	
	private SqlMapClient smc;
	private static IFacDao dao;
	
	private FacDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static IFacDao getDao() {
		if(dao == null) dao = new FacDaoImpl();
		
		return dao;
		
		
	}

	@Override
	//public List<FacVO> updateScore() throws SQLException {
	public int updateScore(FacVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.update("facscore.updateScore", vo);
	}
	
	@Override
	public List<FacVO> selectScoreAvg() throws SQLException {
		
		return smc.queryForList("facscore.selectScoreAvg");
	}
	

	@Override
	public List<FacVO> selectByFac(int count) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("facscore.getFac",count);
	}

}
