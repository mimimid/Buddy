package web.dao.face.date;

import java.util.List;

import web.dto.DateBoard;

public interface DateDao {
	
	/**
	 * 전체 게시글 수 조회
	 * 
	 * @return 게시글 목록 조회
	 */
	public List<DateBoard> selectAllList();

	/**
	 * 조회수순 게시글 조회
	 * 
	 * @return 게시글 목록 조회
	 */
	public List<DateBoard> selectHitList();
	
//	/**
//	 * 전체 게시글 수를 조회한다
//	 * 
//	 * @return 총 게시글 수
//	 */
//	public int selectCntAll();

}
