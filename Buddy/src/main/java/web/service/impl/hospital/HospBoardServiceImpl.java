package web.service.impl.hospital;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.hospital.HospBoardDao;
import web.dto.HospBoard;
import web.dto.HospbCmt;
import web.dto.HospbFile;
import web.dto.HospbLike;
import web.dto.HospbPaging;
import web.service.face.hospital.HospBoardService;

@Service
public class HospBoardServiceImpl implements HospBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HospBoardDao hospBoardDao;
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;
	

	@Override
	public HospbPaging getPaging(String animal, String category, String searchType, String keyWord, int curPage) {
		
		HospbPaging paramPaging = new HospbPaging();
		paramPaging.setAnimal(animal);
		paramPaging.setCategory(category);
		paramPaging.setSearchType(searchType);
		paramPaging.setKeyWord(keyWord);
		
		//총 게시글 수 조회하기
		int totalCount = hospBoardDao.selectCntAll(paramPaging);
		
		//페이징 계산
		HospbPaging hospbPaging = new HospbPaging(totalCount, curPage);
		
		return hospbPaging;
	}
	
	
	
	@Override
	public List<HospBoard> list(HospbPaging hospbPaging) {
		
		//게시판 목록 조회
		List<HospBoard> boardList = hospBoardDao.selectAll(hospbPaging);							
		return boardList;
	}
	
	
	

	@Override
	public HospBoard view(HospBoard viewBoard) {

		//조회수 증가
		hospBoardDao.updateHit(viewBoard);
		
		//상세보기 조회 결과 리턴
		return hospBoardDao.selectBoard(viewBoard);
	}


	
	
	@Override
	public void write(HospBoard board, MultipartFile file) {
		
		//게시글 처리
		if("".equals(board.getHbtitle() ) ) {
			board.setHbtitle("(제목없음)");
		}
		
		hospBoardDao.insertBoard(board);
		
		//-----------------------------------
		
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
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID 추가
		
		//실제 저장 될 파일의 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
		
		//----------------------------------------------
		
		//첨부파일 정보 DB 기록
		HospbFile hospFile = new HospbFile();
		
		hospFile.setHbno(board.getHbno());
		hospFile.setHbfileoriginname(originName);
		hospFile.setHbfilestoredname(storedName);
		
		hospBoardDao.insertFile(hospFile);
		
	}
	
	
	
	
	@Override
	public HospbFile getAttachFile(HospBoard viewBoard) {

		return hospBoardDao.selectBoardFileByBoardNo(viewBoard);
	}


	@Override
	public HospbFile getFile(HospbFile hospbfile) {
		return hospBoardDao.selectBoardFileByFileNo(hospbfile);
	}
	

	@Override
	public void update(HospBoard board, MultipartFile file) {
		
		//게시글 처리
		if("".equals(board.getHbtitle() ) ) {
			board.setHbtitle("(제목없음)");
		}
		
		hospBoardDao.updateBoard(board);
		
		//-----------------------------------
		
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
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID 추가
		
		//실제 저장 될 파일의 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
		
		//----------------------------------------------
		
		//첨부파일 정보 DB 기록
		HospbFile hospFile = new HospbFile();
		
		hospFile.setHbno(board.getHbno());
		hospFile.setHbfileoriginname(originName);
		hospFile.setHbfilestoredname(storedName);
		
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		hospBoardDao.deleteFile(board);
		
		hospBoardDao.insertFile(hospFile);
		
	}



	@Override
	public void delete(HospBoard board) {
		
		//첨부파일 삭제
		hospBoardDao.deleteFile(board);
		hospBoardDao.delete(board);
		
		
	}

	
	
	
	// 좋아요
	
	@Override
	public int findLike(HospBoard viewBoard, int userno) {
		
		HospbLike like = new HospbLike();
		
		like.setHbno(viewBoard.getHbno());
		like.setUserno(userno);
		
		if( hospBoardDao.findLike(like) > 0 ) {
			return 1;
		} 
		
		return 0;
	}
	
	
	@Override
	public void likeUp(HospbLike like) {
		
		int res = 0;
		
		res = hospBoardDao.likeUp(like);
		
		if(res == 1) {
			HospBoard board = new HospBoard();
			board.setHbno(like.getHbno());

			hospBoardDao.likeCntUp(board);
		}
		
	}
	
	
	@Override
	public void likeDown(HospbLike like) {
		
		int res = 0;
				
		res = hospBoardDao.likeDown(like);
		
		if(res == 1) {
			HospBoard board = new HospBoard();
			board.setHbno(like.getHbno());

			hospBoardDao.likeCntDown(board);
		}
	}

	
	
// 댓글

	
	
	
	@Override
	public List<HospbCmt> cmtList(int hbno) {
		
		return hospBoardDao.selectAllCmt(hbno);
	}
	
	@Override
	public void cmtWrite(HospbCmt hospbCmt) {
		
		int res = 0;
		
		if(hospbCmt.getHbCmtBundle() == 0) {
			
			res = hospBoardDao.insertCmt(hospbCmt);
			
		} else {
			
			res = hospBoardDao.insertReCmt(hospbCmt);
			
		}
		

		if(res == 1) {
			HospBoard board = new HospBoard();
			board.setHbno(hospbCmt.getHbno());

			hospBoardDao.cmtUp(board);
			hospBoardDao.cmtCnt(board);
		}
	}
	
	
	@Override
	public void cmtDelete(HospbCmt hospbCmt) {
		
		int res = 0;
		
		res = hospBoardDao.deleteCmt(hospbCmt);
		
		if(res == 1) {
			HospBoard board = new HospBoard();
			board.setHbno(hospbCmt.getHbno());

			hospBoardDao.cmtDown(board);
			hospBoardDao.cmtCnt(board);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
