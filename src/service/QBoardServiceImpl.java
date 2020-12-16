package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IQBoardDao;
import dao.QBoardDaoImpl;
import vo.QBoardVO;
import vo.QReplyVO;

public class QBoardServiceImpl implements IQBoardService{
	
	
	private IQBoardDao dao;
	private static IQBoardService service;
	
	private QBoardServiceImpl() {
		dao = QBoardDaoImpl.getDao();
	}
	
	public static IQBoardService getService() {
		if(service==null) service = new QBoardServiceImpl();
		
		return service;
	}
	
	
	@Override
	public List<QBoardVO> qbolistPage(Map<String, Object> map) {
		
		List<QBoardVO> list = null;
		
		try {
			list = dao.qbolistPage(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int qbogetTotalCount() {
		int cnt = 0;
		
		try {
			cnt = dao.qbogetTotalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public int insertQBoard(QBoardVO vo) {
		int q_no = 0;
		
		try {
			q_no = dao.insertQBoard(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return q_no;
	}
	@Override
	public int insertQBoard2(QBoardVO vo) {
		int q_no = 0;
		
		try {
			q_no = dao.insertQBoard2(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return q_no;
	}

	@Override
	public int deleteQBoard(QBoardVO qboVo) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteQBoard(qboVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public int deleteQBoard2(QBoardVO qboVo) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteQBoard2(qboVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateQBoard(QBoardVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateQBoard(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public int updateQBoard2(QBoardVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateQBoard2(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<QReplyVO> listQReply(int q_no) {
		List<QReplyVO> list = null;
		
		try {
			list = dao.listQReply(q_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertQReply(QReplyVO vo) {
		int qre_no = 0;
		
		try {
			qre_no = dao.insertQReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qre_no;
	}

	@Override
	public int updateQReply(QReplyVO vo) {
		int res=0;
		
		try {
			res=dao.updateQReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteQReply(int qre_no) {
		int res = 0;
		
		try {
			res = dao.deleteQReply(qre_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
