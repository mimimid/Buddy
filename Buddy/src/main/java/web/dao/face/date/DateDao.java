package web.dao.face.date;

import java.util.HashMap;
import java.util.List;

import web.dto.DateBoard;
import web.util.Paging;

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
	
	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param category
	 * @param sort - 정렬방식 객체
	 * @param keywoard - 검색입력 객체
	 * @return 총 게시글 수
	 */
	public int selectCntAll(HashMap<String, Object> map);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param category - 카테고리 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<DateBoard> selectList(HashMap<String, Object> map);

}
