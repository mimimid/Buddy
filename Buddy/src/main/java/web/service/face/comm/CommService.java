package web.service.face.comm;

import java.util.List;

import web.dto.CommBoard;
import web.util.Paging;

public interface CommService {
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	public List<CommBoard> list(Paging paging);

	public CommBoard view(CommBoard viewBoard);

}
