package web.dao.face.shopping;

import java.util.List;

import web.dto.AniProduct;
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

}
