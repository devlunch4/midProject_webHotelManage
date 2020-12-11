package dao;

import java.sql.SQLException;

import vo.ResvlogVO;

public interface IResVLogDao {
	
	public int insertResVLog(ResvlogVO vo) throws SQLException;

}
