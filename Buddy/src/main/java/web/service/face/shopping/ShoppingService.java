package web.service.face.shopping;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.AniProduct;
import web.dto.AniReview;
import web.util.Paging;

public interface ShoppingService {

	/**
	 * 상품 목록을 위한 페이징 객체 생성 
	 * @param curPage 요청 페이징 번호
	 * @return 계산이 완료된 페이징 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징 된 게시글 목록 가저오기
	 * @param paging
	 * @return
	 */
	public List<AniProduct> getList(Paging paging);

	/**
	 * 상품 입력처리
	 * @param product
	 * @param img
	 */
	public void input(AniProduct product, MultipartFile img);

	/**
	 * 상품 상세보기
	 * @param productno
	 * @return
	 */
	public AniProduct view(int productno);

	/**
	 * 리뷰 조회
	 * @param productno
	 * @return
	 */
	public List<AniReview> viewReview(int productno);

	/**
	 * 리뷰 작성
	 * @param review
	 */
	public void inputReview(AniReview review);

	/**
	 * 리뷰 삭제
	 * @param review
	 */
	public void deleteReview(AniReview review);

	

}
