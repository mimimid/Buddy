package web.service.impl.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.mypage.MypageDao;
import web.dto.AniUser;
import web.service.face.mypage.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDao mypageDao;
	
	@Override
	public void deleteUser(int userno) {
		mypageDao.deleteByUserno(userno);
	}
	
	@Override
	public void updateUser(AniUser user) {
		mypageDao.updateByUserno(user);
	}

}
