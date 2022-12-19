package web.service.impl.date;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.date.DCommentDao;
import web.dto.DateBoard;
import web.dto.DateComment;
import web.service.face.date.DCommentService;
import web.util.Paging;

@Service
public class DCommentServiceImpl implements DCommentService {
	
	@Autowired DCommentDao dCommentDao;
	
	@Override
	public Paging getCommPaging(int curPage, DateBoard dateNo) {
		
		int totalCount = dCommentDao.selectCntAll(dateNo);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<DateComment> getCommList(Paging paging, DateBoard dateNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("dateNo", dateNo);
		
		return dCommentDao.getCommList(map);
	}
	
	@Override
	public int getuserNo(String id) {
		return dCommentDao.getUserNo(id);
	}
	
	@Override
	public void commWrite(DateComment comm) {
		dCommentDao.insertComm(comm);
	}

	@Override
	public void updateComm(DateComment comm) {
		dCommentDao.updateByCmNo(comm);
	}
	
	@Override
	public void deleteComm(DateComment cmNo) {
		dCommentDao.delectByCmNo(cmNo);
	}
	
}
