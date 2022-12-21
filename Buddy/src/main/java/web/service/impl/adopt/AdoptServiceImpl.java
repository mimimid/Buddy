package web.service.impl.adopt;


import org.springframework.stereotype.Service;

import web.service.face.adopt.AdoptService;

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

import web.dao.face.adopt.AdoptDao;
import web.dto.AdoptCmt;
import web.dto.AdoptFile;
import web.dto.AdoptPro;
import web.dto.AdoptResrchFile;
import web.dto.AdoptWish;
import web.service.face.adopt.AdoptService;
import web.util.Paging;


@Service
public class AdoptServiceImpl implements AdoptService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired AdoptDao adoptDao;

	@Autowired ServletContext context;
	
	@Override
	public Paging getProPaging(int curPage, String aniCate) {

		int totalCount = adoptDao.selectProCntAll(aniCate);
		
		Paging paging = new Paging(totalCount, curPage, 8 );
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> proList(Map<String, Object> map) {
		return adoptDao.selectProList(map);
	}
	
	@Override
	public int proWish(AdoptWish adoptWish) {
		
		//찜 확인
		int cnt = adoptDao.checkProWish(adoptWish);
		
		if(cnt <= 0) {
			//찜 추가
			adoptDao.insertProWish(adoptWish);
			return 1;
		}else if(cnt > 0) 
			//찜 삭제
			adoptDao.deleteProWish(adoptWish);
			return 0;
		
	}
	
	@Override
	public List<AdoptWish> proWishList() {
		return adoptDao.selectProWishAll();
	}
	
	
	@Override
	public List<AdoptWish> wishList(int userno) {
		
		return adoptDao.selectUserWish(userno);
	}
	
	
	@Override
	public Map<String, Object> proWishDetail(int aniNo) {
		return adoptDao.selectProWish(aniNo);
	}
	
	@Override
	public int wishCount(int userno) {
		return adoptDao.selectWishCount(userno);
	}
	
	@Override
	public void writeProcess(AdoptPro adoptPro, List<MultipartFile> fileList) {

		adoptDao.insertPro(adoptPro);
		
		if( fileList.isEmpty() ) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		 if(!fileList.isEmpty()){
			 
			for(int i = 0; i < fileList.size() ; i++){
				
			String anifileOrigin = fileList.get(i).getOriginalFilename();
			String anifileStored = UUID.randomUUID().toString().split("-")[4] + anifileOrigin;
			
			File dest = new File( storedFolder, anifileStored );
			
			try {
				fileList.get(i).transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			AdoptFile adoptFile = new AdoptFile();
			adoptFile.setAniNo(adoptPro.getAniNo());
			adoptFile.setAnifileOrigin(anifileOrigin);
			adoptFile.setAnifileStored(anifileStored);
			
			adoptDao.insertAdoptFile(adoptFile);		
			
			}
		 }
	}
	
	@Override
	public AdoptFile getAdoptFileDown(AdoptFile adoptFile) {
		return adoptDao.selectAdoptFileByFileNo(adoptFile);
	}
	
	@Override
	public Map<String, Object> adoptView(AdoptPro adoptPro) {
		//조회수 증가
		adoptDao.updateAdoptHit(adoptPro);
		
		//상세보기 조회 결과 리턴
		return adoptDao.selectAdoptView(adoptPro);
	}
	
	@Override
	public List<AdoptFile> getAdoptFile(AdoptPro adoptPro) {
		return adoptDao.selectAdoptFile(adoptPro);
	}
	
	
	@Override
	public void proUpdate(AdoptPro adoptPro, List<MultipartFile> fileList) {
		
		adoptDao.updatePro(adoptPro);
		
		fileList.forEach(f->{
			if(f.getSize() == 0) {
				logger.debug("첨부없음");
				return;	
			}else {
				String storedPath = context.getRealPath("upload");
				File storedFolder = new File( storedPath );
				if( !storedFolder.exists()) {
					storedFolder.mkdir();
				}
				
				adoptDao.deleteAdoptfile(adoptPro);
				 
				for(int i = 0; i < fileList.size() ; i++){
					
				String anifileOrigin = fileList.get(i).getOriginalFilename();
				String anifileStored = UUID.randomUUID().toString().split("-")[4] + anifileOrigin;
				
				File dest = new File( storedFolder, anifileStored );
				
				try {
					fileList.get(i).transferTo(dest);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				AdoptFile adoptFile = new AdoptFile();
				adoptFile.setAniNo(adoptPro.getAniNo());
				adoptFile.setAnifileOrigin(anifileOrigin);
				adoptFile.setAnifileStored(anifileStored);
				
				
				adoptDao.insertAdoptFile(adoptFile);		
				
				}
			}
		});
	}
	
	@Override
	public void adoptDelete(AdoptPro adoptPro) {
		adoptDao.deleteAdoptfile(adoptPro);
		
		adoptDao.deleteAdoptPro(adoptPro);
	}
	
	@Override
	public List<Map<String, Object>> adoptRnumView(int rnum) {
		return adoptDao.selectRnumView(rnum);
	}
	
	@Override
	public void cmtWrite(AdoptCmt adoptCmt) {
		adoptDao.insertCmt(adoptCmt);
		
	}
	
	@Override
	public List<AdoptCmt> adoptCmtView(AdoptPro adoptPro) {
		return adoptDao.selectAdoptCmtView(adoptPro);
	}
	
	@Override
	public int getCmtCnt(AdoptPro adoptPro) {
		return adoptDao.selectCmtCntAll(adoptPro);
	}
	
}
