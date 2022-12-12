package web.service.impl.adopt;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.adopt.ReportDao;
import web.dto.Report;
import web.dto.ReptFile;
import web.service.face.adopt.ReportService;
import web.util.Paging;

@Service
public class ReportServiceImpl implements ReportService {


	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReportDao reportDao;
	
	@Autowired ServletContext context;
	
	@Override
	public int reptGetTotal() {

		return reportDao.reptSelectCntAll();
	}
	
	@Override
	public Paging getReptPaging(int curPage, String reptTitle) {
		
		//총 게시글 수 조회
		int totalCount = (int)reportDao.selectReptCntAll(reptTitle);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		logger.debug("{}",paging);
		return paging;
	}

	@Override
	public List<Map<String, Object>> reptPagingFileList(Map<String, Object> map) {
		return reportDao.selectReptPagingList(map);
	}


	@Override
	public void reptWrite(Report report, MultipartFile file) {

		if("".equals( report.getReptTitle() )) {
			report.setReptTitle("(제목없음)");
		}
		
		reportDao.insertReport(report);
		
		if( file.getSize() <= 0 ) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		String rfileOrigin = file.getOriginalFilename();
		String rfileStored = UUID.randomUUID().toString().split("-")[4] + rfileOrigin;
		
		File dest = new File( storedFolder, rfileStored );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		ReptFile reptFile = new ReptFile();
		reptFile.setReptNo( report.getReptNo() );
		reptFile.setRfileOrigin(rfileOrigin);
		reptFile.setRfileStored(rfileStored);
		
		reportDao.insertReptFile(reptFile);
		
	}
	
	@Override
	public ReptFile getReptViewFile(Report report) {
		return reportDao.selectReptFileByReptNo( report );
	}
	
	@Override
	public ReptFile getFile(ReptFile reptFile) {
		return reportDao.selectReptFileByRfileNo( reptFile );
	}
	
	@Override
	public Report ReptView(Report report) {
		return reportDao.selectRept(report);
	}

	@Override
	public void reptUpdate(Report report, MultipartFile file) {
		//게시글 처리
		if( "".equals( report.getReptTitle() ) ) {
			report.setReptTitle("(제목없음)");
		}
		
		reportDao.updateReport(report);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String rfileOrigin = file.getOriginalFilename();
		String rfileStored = UUID.randomUUID().toString().split("-")[4] + rfileOrigin ;
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, rfileStored );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		ReptFile reptFile = new ReptFile();
		reptFile.setReptNo( report.getReptNo() );
		reptFile.setRfileOrigin(rfileOrigin);
		reptFile.setRfileStored(rfileStored);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		reportDao.deleteReptfile(report);
		
		reportDao.insertReptFile(reptFile);		
		
	}
	
	@Override
	public void reptDelete(Report report) {

		//첨부파일 삭제
		reportDao.deleteReptfile(report);
		
		//게시글 삭제
		reportDao.deleteReport(report);
	}
}
