package web.service.impl.date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.date.DCommentDao;
import web.dto.DateBoard;
import web.dto.DateComment;
import web.service.face.date.DCommentService;

@Service
public class DCommentServiceImpl implements DCommentService {
	
	@Autowired DCommentDao dCommentDao;
	
	@Override
	public List<DateComment> getList(DateBoard dateNo) {
		return dCommentDao.getList(dateNo);
	}
	

}
