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
import web.dto.AniOrder;
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
		//상품 번호 가저오기
		int productno = shoppingDao.selectSeq();
		
		product.setProductno(productno);
		
		//게시글 처리			
		shoppingDao.insertProduct(product);
		
//		logger.debug("productno는  : {}", productno);
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
		productImg.setProductno( product.getProductno());
		productImg.setPimgorigin(originName);
		productImg.setPimgstored(storedName);
				
		shoppingDao.insertImg(productImg);		
		
	}

	@Override
	public AniProduct view(int productno) {
		
		return shoppingDao.selectProductByProductno(productno);
	}

	@Override
	public List<AniReview> viewReview(int productno) {
		
		return shoppingDao.selectReviewByProductno(productno);
	}

	@Override
	public void inputReview(AniReview review) {
		
		String usernick = shoppingDao.selectUserNickByUserNo(review);
		
		
		review.setUsernick(usernick);
		
		shoppingDao.insertReview(review);
		
		shoppingDao.updateReviewCountIncrease(review);
		
		
	}

	@Override
	public void deleteReview(AniReview review) {
		
		shoppingDao.updateReviewCountReduce(review);
		
		shoppingDao.deleteReview(review);
		
	}

	@Override
	public void deleteProduct(int productno) {
		
		//상품 리뷰 삭제
		shoppingDao.deleteReviewByProductno(productno);
		
		//이미지 삭제
		shoppingDao.deleteImgByProductno(productno);
		
		//상품 삭제
		shoppingDao.deleteProdcutByProductno(productno);
		
	}

	@Override
	public AniProduct getProduct(AniOrder order) {
		
		return shoppingDao.selectProductByProductNo(order);
	}

	
	
	

}
