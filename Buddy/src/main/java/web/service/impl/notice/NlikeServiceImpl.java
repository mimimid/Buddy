package web.service.impl.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.notice.NlikeDao;
import web.service.face.notice.NlikeService;

@Service
public class NlikeServiceImpl  implements NlikeService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(NlikeService.class);
	
	@Autowired NlikeDao nlikeDao;

	@Override
	public void likeNotice(HashMap<String, Object> param) {

		nlikeDao.insertNlike(param);
		
	}

	@Override
	public void deleteLike(HashMap<String, Object> param) {
		nlikeDao.deleteNlike(param);
		
	}

	@Override
	public Boolean findLike(int boardno, String userId) {
		logger.info("findLike service()");
		if(nlikeDao.findNlike(boardno, userId) > 0) {
			return true;
		} else {
			return false;
		}
	
		
	}

}
