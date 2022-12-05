package web.service.impl.date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.date.DateDao;
import web.dto.DateBoard;
import web.service.face.date.DateService;
import web.util.Paging;

@Service
public class DateServiceImpl implements DateService {
	
	@Autowired DateDao dateDao;
	
	@Override
	public List<DateBoard> list() {
		return dateDao.selectAllList();
	}
	
	@Override
	public List<DateBoard> hitList() {
		return dateDao.selectHitList();
	}
	
//	@Override
//	public Paging getPaging(int curPage) {
//		
//		int totalCount = dateDao.selectCntAll();
//		
//		Paging paging = new Paging(totalCount, curPage);
//		
//		return paging;
//	}
//	
//	@Override
//	public List<DateBoard> list(Paging paging) {
//		return dateDao.selectList(paging);
//	}

}
