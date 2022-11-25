package web.service.impl.adopt;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.adopt.ReportDao;
import web.dto.Report;
import web.service.face.adopt.ReportService;
import web.util.Paging;

@Service
public class ReportServiceImpl implements ReportService {


	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReportDao reportDao;
	
	@Override
	public Paging reptGetPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = reportDao.reptSelectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Report> reptList(Paging paging) {
		return reportDao.reptSelectList(paging);
	}
	
}
