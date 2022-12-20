package web.service.impl.date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.date.LikeDao;
import web.dto.DateBoard;
import web.dto.DateLike;
import web.service.face.date.LikeService;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired LikeDao likeDao;

	@Override
	public int ckLike(DateBoard viewDate, int userno) {
		
		DateLike like = new DateLike();
		
		like.setDateNo(viewDate.getDateNo());
		like.setUserno(userno);
		
		if( likeDao.selectLike(like) > 0 ) {
			return 1;
		}
		
		return 0;
	}
	
	@Override
	public void insertLike(DateLike like) {
		
		int res = 0;
		
		res = likeDao.insertLike(like);
		
		if( res == 1 ) {
			DateBoard date = new DateBoard();
			date.setDateNo(like.getDateNo());
			
			likeDao.likeCntUp(date);
		}
		
	}
	
	@Override
	public DateBoard likeCnt(DateLike like) {
		return likeDao.selectLikeCntByDateNo(like);
	}
	
	@Override
	public void hate(DateLike like) {
		
		int res = 0;
		
		res = likeDao.deleteLike(like);
		
		if( res == 1 ) {
			DateBoard date = new DateBoard();
			date.setDateNo(like.getDateNo());
			
			likeDao.likeCntDown(date);
		}
		
	}
	
}
