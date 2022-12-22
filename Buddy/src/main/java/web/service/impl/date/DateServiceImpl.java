package web.service.impl.date;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.date.DateDao;
import web.dto.DateBoard;
import web.dto.DateFile;
import web.dto.DateReport;
import web.service.face.date.DateService;
import web.util.Paging;

@Service
public class DateServiceImpl implements DateService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DateDao dateDao;
	@Autowired ServletContext context;
	
	@Override
	public List<DateBoard> list() {
		return dateDao.selectAllList();
	}
	
	@Override
	public List<DateBoard> hitList() {
		return dateDao.selectHitList();
	}
	
	@Override
	public Paging getPaging(int curPage, int category, String keywoard) {
		
//		int totalCount = dateDao.selectCntAll();
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keywoard", keywoard);
		int totalCount = dateDao.selectCntAll(map);
		
		Paging paging = new Paging(totalCount, curPage);
//		Paging paging = new Paging(totalCount, curPage, 9);
		
		return paging;
	}
	
	@Override
	public List<DateBoard> list(Paging paging, int category, String sort, String keywoard) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("category", category);
		map.put("sort", sort);
		map.put("keywoard", keywoard);
		
		return dateDao.selectList(map);
//		return dateDao.selectList(paging, category);
	}
	
	@Override
	public DateBoard view(DateBoard viewDate) {
		
		//조회수 증가
		dateDao.updateHit(viewDate);
		
		//상세보기 조회 결과 리턴
		return dateDao.selectDateDetail(viewDate);
		
	}
	
	@Override
	public void updateCommCount(DateBoard viewDate) {
		dateDao.updateCommCount(viewDate);
	}
	
	@Override
	public void updateLikeCount(DateBoard viewDate) {
		dateDao.updateLikeCount(viewDate);
	}
	
	@Override
	public void report(DateReport report) {
		dateDao.insertReport(report);
	}
	
	@Override
	public void write(DateBoard board, MultipartFile file) {
		
		//게시글 처리
		dateDao.insertBoard(board);
		
		//----------------------------
		
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
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		DateFile dateFile = new DateFile();
		dateFile.setDateNo( board.getDateNo() );
		dateFile.setOriginName(originName);
		dateFile.setStoredName(storedName);
		
		dateDao.insertFile(dateFile);
		
	}
	
}
