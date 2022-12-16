package web.service.impl.comm;

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

import web.dao.face.comm.CommDao;
import web.dto.CommBoard;
import web.dto.CommCmt;
import web.dto.CommFile;
import web.service.face.comm.CommService;
import web.util.Paging;

@Service
public class CommServiceImpl implements CommService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommDao commDao;
	
	@Autowired ServletContext context;
	
	@Override
	public Paging getPaging(int curPage, String animal, String category, String keyword) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("animal", animal);
		map.put("category", category);
		map.put("keyword", keyword);
		int totalCount = commDao.selectCntAll(map);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<CommBoard> list(Paging paging, String animal, String category, String sort, String keyword) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("animal", animal);
		map.put("category", category);
		map.put("sort", sort);
		map.put("keyword", keyword);
		
		return commDao.selectList(map);
	}
	
	@Override
	public CommBoard view(CommBoard viewBoard) {
		
		// 조회수 증가
		commDao.updateHit(viewBoard);
		
		// 상세보기 조회 결과 리턴
		return commDao.selectBoard(viewBoard);
	}
	
	@Override
	public void write(CommBoard commBoard, MultipartFile file) {
		
		// 게시글 처리
		if( "".equals( commBoard.getCommTitle() ) ) {
			commBoard.setCommTitle("(제목없음)");
		}
		
		commDao.insertCommBoard(commBoard);
		
		//--------------------------------------------
		
		// 첨부파일 처리
		
		// 빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String commFileOriginName = file.getOriginalFilename();
		String commFileStoredname = commFileOriginName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, commFileStoredname );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		// 첨부파일 정보 DB 기록
		CommFile commFile = new CommFile();
		commFile.setCommNo( commBoard.getCommNo() );
		commFile.setCommFileOriginname(commFileOriginName);
		commFile.setCommFileStoredname(commFileStoredname);
		commFile.setCommFileSize((int)file.getSize());
		
		commDao.insertCommFile(commFile);
		
	}
	
	@Override
	public CommFile getAttachFile(CommBoard viewBoard) {
		return commDao.selectCommFileByCommNo(viewBoard);
	}
	
	@Override
	public CommFile getFile(CommFile commFile) {
		return commDao.selectCommFileByCommFileNo(commFile);
	}
	
	@Override
	public void update(CommBoard commBoard, MultipartFile file) {
		
		// 게시글 처리
		if( "".equals( commBoard.getCommTitle() ) ) {
			commBoard.setCommTitle("(제목없음)");
		}
		
		commDao.updateCommBoard(commBoard);
		
		//--------------------------------------------
		
		// 첨부파일 처리
		
		// 빈 파일일 경우
		if( file.getSize() <= 0 ) {
			commDao.deleteCommFile(commBoard);
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String commFileOriginName = file.getOriginalFilename();
		String commFileStoredname = commFileOriginName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, commFileStoredname );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		// 첨부파일 정보 DB 기록
		CommFile commFile = new CommFile();
		commFile.setCommNo( commBoard.getCommNo() );
		commFile.setCommFileOriginname(commFileOriginName);
		commFile.setCommFileStoredname(commFileStoredname);
		commFile.setCommFileSize((int)file.getSize());
		
		// 기존에 게시글에 연결된 첨부파일을 삭제한다
		commDao.deleteCommFile(commBoard);
		
		commDao.insertCommFile(commFile);
		
	}
	
	@Override
	public void delete(CommBoard commBoard) {
		
		// 첨부파일 삭제
		commDao.deleteCommFile(commBoard);
		
		// 게시글 삭제
		commDao.delete(commBoard);
		
	}
	
	@Override
	public List<CommCmt> cmtList(int commNo) {
		return commDao.selectAllCmt(commNo);
	}
	
	@Override
	public void cmtWrite(CommCmt commCmt) {
		
		int res = 0;
		
		
		if( commCmt.getCommCmtBundle() == 0 ) {
			
			// 댓글 그룹이 없을 경우
			res = commDao.insertCmt(commCmt);
			
		} else {
			
			// 댓글 그룹이 있을 경우
			res = commDao.insertReCmt(commCmt);
			
		}
		
		if( res == 1 ) {
			
			CommBoard commBoard = new CommBoard();
			commBoard.setCommNo(commCmt.getCommNo());
			
			commDao.cmtUp(commBoard);
			commDao.cmtCnt(commBoard);
			
		}
		
	}
	
	@Override
	public void cmtDelete(CommCmt commCmt) {
		
		int res = 0;
		
		res = commDao.deleteCmt(commCmt);
		
		if( res == 1 ) {
			
			CommBoard commBoard = new CommBoard();
			commBoard.setCommNo(commCmt.getCommNo());
			
			commDao.cmtDown(commBoard);
			commDao.cmtCnt(commBoard);
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
