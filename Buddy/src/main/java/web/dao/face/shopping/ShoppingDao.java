package web.dao.face.shopping;

import java.util.List;

import web.dto.AniOrder;
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
	 * 다음 시퀀스 번호 가저오기
	 * @return
	 */
	public int selectSeq();
	
	/**
	 * 상품 정보 입력
	 * @param product
	 * @return 
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
	public List<AniReview> selectReviewByProductno(int productno);

	/**
	 * 유저번호로 유저 닉네임 가저오기
	 * @param review
	 * @return
	 */
	public String selectUserNickByUserNo(AniReview review);
	
	/**
	 * 리뷰 작성
	 * @param review
	 */
	public void insertReview(AniReview review);

	/**
	 * 리뷰 카운트 증가
	 * @param review
	 */
	public void updateReviewCountIncrease(AniReview review);

	/**
	 * 리뷰 삭제 
	 * @param review
	 */
	public void deleteReview(AniReview review);

	/**
	 * 리뷰 카운트 감소
	 * @param review
	 */
	public void updateReviewCountReduce(AniReview review);

	/**
	 * 상품 삭제
	 * @param productno
	 */
	public void deleteProdcutByProductno(int productno);

	/**
	 * 상품 리뷰 삭제
	 * @param productno
	 */
	public void deleteReviewByProductno(int productno);

	/**
	 * 상품 이미지 삭제
	 * @param productno
	 */
	public void deleteImgByProductno(int productno);

	/**
	 * 상품번호로 상품이미지 상품이름 조회
	 * @param order
	 * @return
	 */
	public AniProduct selectProductByProductNo(AniOrder order);
	
	/**
	 * 주문 시퀀스 번호 가저오기
	 * @return
	 */
	public int selectOrderSeq();

	/**
	 * 주문내용 입력
	 * @param order
	 */
	public void insertOrder(AniOrder order);

	/**
	 * 주문번호로 주문정보 조회
	 * @param order
	 * @return
	 */
	public AniOrder selectOrder(AniOrder order);

	
	

	



	

}
