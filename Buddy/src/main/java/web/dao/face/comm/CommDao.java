package web.dao.face.comm;

import java.util.List;

import web.dto.CommBoard;
import web.util.Paging;

public interface CommDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	public List<CommBoard> selectList(Paging paging);

	public void updateHit(CommBoard viewBoard);

	public CommBoard selectBoard(CommBoard viewBoard);

}
