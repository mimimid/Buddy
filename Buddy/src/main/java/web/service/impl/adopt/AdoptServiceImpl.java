package web.service.impl.adopt;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.adopt.AdoptDao;
import web.dto.AdoptPro;
import web.service.face.adopt.AdoptService;
import web.util.Paging;

@Service
public class AdoptServiceImpl implements AdoptService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired AdoptDao adoptDao;

	@Autowired ServletContext context;
	
	@Override
	public Paging getProPaging(int curPage) {

		int totalCount = adoptDao.selectProCntAll();
		
		Paging paging = new Paging(totalCount, curPage, 8, 5);
		
		return paging;
	}
	
	@Override
	public List<AdoptPro> proList(Paging paging) {
		return adoptDao.selectProList(paging);
	}
	
	
}
