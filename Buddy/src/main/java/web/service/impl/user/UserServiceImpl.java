package web.service.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.user.UserDao;
import web.dto.AniUser;
import web.service.face.user.UserService;

@Service
public class UserServiceImpl implements UserService  {
	
	@Autowired private UserDao userDao;

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
	public boolean join(AniUser user, MultipartFile img) {
		//아이디
//		int idcheck 
		
		return false;
	}

	


}
