package web.service.impl.mypage;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.mypage.MypageDao;
import web.dto.AniUser;
import web.dto.QnaBoard;
import web.service.face.mypage.MypageService;
import web.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDao mypageDao;
	
	@Override
	public void deleteUser(int userno) {
		mypageDao.deleteByUserno(userno);
	}
	
	@Override
	public void updateUser(AniUser user) {
		mypageDao.updateByUserno(user);
	}
	
	@Override
	public Paging getPaging(int curPage, int userno) {
		int totalCount = mypageDao.selectCntAll(userno);
		
		Paging paging = new Paging(totalCount, curPage, 5);
		
		return paging;
	}
	
	@Override
	public List<QnaBoard> list(int userno, Paging paging) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userno", userno);
		map.put("paging", paging);
		
		return mypageDao.selectListByUserno(map);
	}
	
	@Override
	public int listCnt(int userno) {
		return mypageDao.selectCntAll(userno);
	}
	
	@Override
	public QnaBoard view(QnaBoard viewBoard) {
		return mypageDao.selectBoard(viewBoard);
	}
	
	@Override
	public void write(QnaBoard board) {
		mypageDao.insertBoard(board);
	}

}
