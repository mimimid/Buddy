package web.dao.face.shopping;

import java.util.List;

import web.dto.AniProduct;
import web.dto.AniProductImg;
import web.dto.AniReview;
import web.util.Paging;

public interface ShoppingDao {

	/**
	 * 총 상품 수 반환
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 조회
	 * @param paging
	 * @return
	 */
	public List<AniProduct> selectList(Paging paging);

	/**
	 * 상품 정보 입력
	 * @param product
	 */
	public void insertProduct(AniProduct product);

	/**
	 * 상품 이름으로 상품번호 가저오기
	 * @param product
	 * @return
	 */
	public int selectProductNoByProductName(AniProduct product);

	/**
	 * 상품 이미지 정보 입력
	 * @param productImg
	 */
	public void insertImg(AniProductImg productImg);

	/**
	 * 상품번호로 상품 상세정보 조회
	 * @param productno
	 * @return
	 */
	public AniProduct selectProductByProductno(int productno);

	/**
	 * 상품번호로 상품 리뷰 조회
	 * @param productno
	 * @return
	 */
	public AniReview selectReviewByProductno(int productno);

	

}
