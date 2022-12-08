package web.service.face.shopping;

import java.util.List;

import web.dto.AniProduct;
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

}
