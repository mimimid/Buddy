package web.service.impl.comm;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.comm.CommDao;
import web.dto.CommBoard;
import web.service.face.comm.CommService;
import web.util.Paging;

@Service
public class CommServiceImpl implements CommService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommDao commDao;
	
	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = commDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<CommBoard> list(Paging paging) {
		return commDao.selectList(paging);
	}
	
	@Override
	public CommBoard view(CommBoard viewBoard) {
		
		// 조회수 증가
		commDao.updateHit(viewBoard);
		
		// 상세보기 조회 결과 리턴
		return commDao.selectBoard(viewBoard);
	}

}
