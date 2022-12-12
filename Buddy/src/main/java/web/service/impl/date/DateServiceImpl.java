package web.service.impl.date;

import java.util.HashMap;
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
	
	@Override
	public Paging getPaging(int curPage, int category, String keywoard) {
		
//		int totalCount = dateDao.selectCntAll();
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keywoard", keywoard);
		int totalCount = dateDao.selectCntAll(map);
		
		Paging paging = new Paging(totalCount, curPage);
//		Paging paging = new Paging(totalCount, curPage, 9);
		
		return paging;
	}
	
	@Override
	public List<DateBoard> list(Paging paging, int category, String sort, String keywoard) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("category", category);
		map.put("sort", sort);
		map.put("keywoard", keywoard);
		
		return dateDao.selectList(map);
//		return dateDao.selectList(paging, category);
	}
	
	@Override
	public DateBoard view(DateBoard viewDate) {
		
		//조회수 증가
		dateDao.updateHit(viewDate);
		
		//상세보기 조회 결과 리턴
		return dateDao.selectDateDetail(viewDate);
		
	}

}
