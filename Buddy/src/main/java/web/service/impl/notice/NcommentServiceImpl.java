package web.service.impl.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.notice.NcommentDao;
import web.dto.notice.Ncomment;
import web.service.face.notice.NcommentService;

@Service
public class NcommentServiceImpl implements NcommentService {
	
	private static final Logger logger = LoggerFactory.getLogger(NcommentService.class);
	@Autowired NcommentDao ncommetnDao;

	@Override
	public void write(Ncomment bcomment) {
		ncommetnDao.insert(bcomment);
	}

	@Override
	public List<HashMap<String, Object>> findLikedCmts(int boardno, String userId) {
		ncommetnDao.findcmts(boardno, userId);
		return null;
	}

	@Override
	public void modify(Ncomment bcomment) {
		ncommetnDao.update(bcomment);
	}

	@Override
	public List<HashMap<String, Object>> listByRecent(int boardno) {
		
		return ncommetnDao.selectAllByRecent(boardno);
	}

	@Override
	public List<HashMap<String, Object>> listByLike(int boardno) {

		return ncommetnDao.selectAllByLike(boardno);
	}

	@Override
	public List<Map<String, Object>> likedCmtNo(String userid, int noticeno) {
		List<Map<String, Object>> result = ncommetnDao.selectLikeCmts(userid,noticeno);
		if (result.isEmpty() ) {
			HashMap<String, Object> map = new HashMap();
			map.put("USER_ID", "좋아요 한 사람 없음");
			result.add(map);
			return result;
		} else {
			return ncommetnDao.selectLikeCmts(userid,noticeno);
			}
	}

	@Override
	public void like(int ncmtno, String userid) {
		ncommetnDao.insertLike(ncmtno, userid);
		
	}

	@Override
	public void disLike(int ncmtno) {
		ncommetnDao.deleteLike(ncmtno);
		
	}

	@Override
	public void delete(Ncomment ncomment) {
		ncommetnDao.delete(ncomment);
		
	}


}
