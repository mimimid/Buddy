package web.service.impl.shopping;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.shopping.ShoppingDao;
import web.dto.AniProduct;
import web.service.face.shopping.ShoppingService;
import web.util.Paging;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ShoppingDao shoppingDao;

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = shoppingDao.selectCntAll();
//		logger.debug("총 상품의 수는{}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage);
		
		
		return paging;
	}

	@Override
	public List<AniProduct> getList(Paging paging) {
		
		
		return shoppingDao.selectList(paging);
	}

}
