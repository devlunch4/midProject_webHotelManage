package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.INoticeDao;
import dao.NoticeDaoImpl;
import vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	
	private INoticeDao dao;
	private static INoticeService service;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getDao();
	}
	
	public static INoticeService getService() {
		if(service==null) service = new NoticeServiceImpl();
		
		return service;
	}
	
//	@Override
//	public List<NoticeVO> nolistAll() {
//		
//		List<NoticeVO> list = null;
//		
//		try {
//			list = dao.nolistAll();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
	
	@Override
	public List<NoticeVO> nolistPage(Map<String, Object> map) {
		
		List<NoticeVO> list = null;
		
		try {
			list = dao.nolistPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int getTotalCount() {
		int cnt = 0;
		
		try {
			cnt = dao.getTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public int insertNotice(NoticeVO vo) {
		int noti_no = 0;
		
		try {
			noti_no = dao.insertNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noti_no;
	}

	@Override
	public int deleteNotice(int noti_no) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteNotice(noti_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateNotice(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}



}
