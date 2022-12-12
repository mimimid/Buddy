package web.service.impl.notice;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.notice.NfileDao;
import web.dto.notice.Nfile;
import web.service.face.notice.NfileService;

@Service
public class NfileServiceImpl implements NfileService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(NfileService.class);
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;
	
	@Autowired NfileDao bfileDao;

	@Override
	public void write(int boardno, MultipartFile file) {
		logger.info("filewrite()");
		
		//파일의 크기 0일 때 파일 업로드 처리 중단
		if( file.getSize() <= 0 ) {
			logger.info("파일의 크기가 0, 처리 중단!");
			
			return;
		}
		
		//파일이 저장될 경로 ( RealPath )
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일 이름 생성하기
		String storedName = file.getOriginalFilename(); //원본파일명
		storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
		logger.info("storedName : {}", storedName);
		
		
		//실제 저장될 파일의 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Nfile bfile = new Nfile();
		
		bfile.setBoardno(boardno);
		bfile.setOriginName(file.getOriginalFilename());
		bfile.setStoredName(storedName);
		
		bfileDao.insert(bfile);
		
	}

}
