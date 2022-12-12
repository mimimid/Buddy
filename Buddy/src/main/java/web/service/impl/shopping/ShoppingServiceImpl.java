package web.service.impl.shopping;

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

import web.dao.face.shopping.ShoppingDao;
import web.dto.AniProduct;
import web.dto.AniProductImg;
import web.dto.AniReview;
import web.service.face.shopping.ShoppingService;
import web.util.Paging;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ShoppingDao shoppingDao;
	
	@Autowired ServletContext context;

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

	@Override
	public void input(AniProduct product, MultipartFile img) {
		//게시글 처리			
		shoppingDao.insertProduct(product);
				
		//--------------------------------------------
				
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
		AniProductImg productImg = new AniProductImg();
		productImg.setProductno( shoppingDao.selectProductNoByProductName(product));
		productImg.setPimgorigin(originName);
		productImg.setPimgstored(storedName);
				
		shoppingDao.insertImg(productImg);		
		
	}

	@Override
	public AniProduct view(int productno) {
		
		return shoppingDao.selectProductByProductno(productno);
	}

	@Override
	public AniReview viewReview(int productno) {
		
		return shoppingDao.selectReviewByProductno(productno);
	}

	

}
