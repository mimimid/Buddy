package web.service.impl.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.notice.NoticeDao;
import web.dto.notice.Notice;
import web.service.face.notice.NoticeService;
import web.util.notice.Paging;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeService.class);
	
	@Autowired NoticeDao noticeDao;

	@Override
	public void write(Notice notice) {
		
		logger.info("BoardService write() 실행");

		noticeDao.insert(notice);	
	}

	@Override
	public int getNextNoticeno() {
		return noticeDao.nextseq();
	}

	@Override
	public List<HashMap<String, Object>> findByNo(int boardno) {

		return noticeDao.selectByNo(boardno);
	}

	@Override
	public void view(int noticeno) {
		logger.info("view service() 실행");
		noticeDao.hit(noticeno);
	}


	@Override
	public Paging getPaging(int curPage) {

		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> list(Paging paging) {
		return noticeDao.selectList(paging);
	}

	//검색 후 페이징
	@Override
	public Paging getPagingSearch(int curPage, String keyword) {
		
		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAllSearch(keyword);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public List<Map<String, Object>> search(Paging paging, String keyword) {

		return noticeDao.selectSearchList(paging, keyword);
	}





}
