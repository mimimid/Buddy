package web.service.face.adopt;

import java.util.List;

import web.dto.AdoptPro;
import web.util.Paging;

public interface AdoptService {

	/**
	 * 입양프로필 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getProPaging(int curPage);

	/**
	 * 페이징이 적용된 입양프로필 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 입양프로필 목록
	 */
	public List<AdoptPro> proList(Paging paging);

}
