package web.service.impl.adopt;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.adopt.AdoptResrchDao;
import web.dto.AdoptResearch;
import web.dto.AdoptResrchFile;
import web.service.face.adopt.AdoptResrchService;
import web.util.Paging;

@Service
public class AdoptResrchServiceImpl implements AdoptResrchService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdoptResrchDao adoptResrchDao;
	
	@Autowired ServletContext context;
	
	@Override
	public void adoptAnswer(AdoptResearch adoptResearch, List<MultipartFile> fileList) {

		adoptResrchDao.insertResearch(adoptResearch);
		
		if( fileList.size() <= 0 ) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists()) {
			storedFolder.mkdir();
		}
	
		 if(!fileList.isEmpty()){
			 
			for(int i = 0; i < fileList.size() ; i++){
				
			String resrchfileOrigin = fileList.get(i).getOriginalFilename();
			String resrchfileStored = UUID.randomUUID().toString().split("-")[4] + resrchfileOrigin;
			
			File dest = new File( storedFolder, resrchfileStored );
			
			try {
				fileList.get(i).transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			AdoptResrchFile adoptResrchFile = new AdoptResrchFile();
			adoptResrchFile.setAdoptNo(adoptResearch.getAdoptNo());
			adoptResrchFile.setResrchfileOrigin(resrchfileOrigin);
			adoptResrchFile.setResrchfileStored(resrchfileStored);
			
			adoptResrchDao.insertResrchFile(adoptResrchFile);		
			
			}
		 }
	}
	
	@Override
	public Paging getResrchPaging(int curPage) {

		//총 게시글 수 조회
		int totalCount = adoptResrchDao.selectResrchCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage, 15, 5);
		
		return paging;
	}
	
	@Override
	public List<AdoptResearch> Resrchlist(Paging paging) {
		return adoptResrchDao.selectResrchList(paging);
	}
	
	@Override
	public AdoptResearch resrchView(AdoptResearch viewResearch) {
		//조회수 증가
		adoptResrchDao.updateAnswerHit(viewResearch);
		
		//상세보기 조회 결과 리턴
		return adoptResrchDao.selectResrchView(viewResearch);
	}
	
	@Override
	public List<AdoptResrchFile> getResrchFile(AdoptResearch viewResearch) {
		return adoptResrchDao.selectResrchFile(viewResearch);
	}
	
	@Override
	public void updateResrchView(Map<String, Object> map) {
		
		adoptResrchDao.updateResrchChecking(map);
		
	}
	
	@Override
	public AdoptResrchFile getResrchFileDown(AdoptResrchFile adoptResrchFile) {
		return adoptResrchDao.selectResrchFileByFileNo(adoptResrchFile);
	}
	
	
}
