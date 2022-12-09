package web.service.impl.user;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.user.UserDao;
import web.dto.AniUser;
import web.dto.AniUserImg;
import web.service.face.user.UserService;

@Service
public class UserServiceImpl implements UserService  {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private UserDao userDao;
	
	@Autowired ServletContext context;

	@Override
	public boolean login(AniUser user) {
		if(userDao.selectCntByIdPw(user)>0) {
			return true;
		}
		return false;
	}

	@Override
	public AniUser getUserInfo(AniUser user) {
		
		return userDao.selectAllById(user);
	}

	@Override
	public boolean idCheck(String userid) {
		
		int cnt = userDao.selectCntById(userid);
		
		if(cnt>0) {
			
			return true;
		} else {
			return false;
		}
		
	}
	@Override
	public boolean join(AniUser user) {
		//아이디중복 체크
		if(userDao.selectCntById(user.getUserid())>0) {
			return false;
		}
		
		userDao.insertUser(user);
		
		if(userDao.selectCntById(user.getUserid())>0) {
			return true;
		} return false;
	}

	@Override
	public void insertImg(AniUser user, MultipartFile img) {
		//첨부파일 처리
		
		//빈 파일일 경우
		if( img.getSize() <= 0 ) {
			return;
		}
				
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
				
		
		//파일이 저장될 이름
		String originName = img.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		
				
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
				
		try {
			img.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		//--------------------------------------------
				
		//첨부파일 정보 DB 기록
		AniUserImg aniUserImg = new AniUserImg();
		aniUserImg.setUserno( user.getUserno() );
		aniUserImg.setImgorigin(originName);
		aniUserImg.setImgstored(storedName);
		aniUserImg.setImgsize((int)img.getSize());
				
		userDao.insertImg(aniUserImg);	
		
	}

	@Override
	public String findId(AniUser user) {
		
		return userDao.selectIdByNamePhone(user);
	}

	@Override
	public String findPw(AniUser user) {
		
		return userDao.selectPwByIdNamePhone(user);
	}

	


}
