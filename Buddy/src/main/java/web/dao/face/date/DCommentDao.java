package web.dao.face.date;

import java.util.HashMap;
import java.util.List;

import web.dto.DateBoard;
import web.dto.DateComment;

public interface DCommentDao {
	
	/**
	 * 전체 댓글 수를 조회한다
	 * 
	 * @param dateNo - 조회할 게시글 번호
	 * @return 총 댓글수
	 */
	public int selectCntAll(DateBoard dateNo);

	/**
	 * 전체 댓글 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param dateNo - 게시글 번호 객체
	 * @return 페이징이 적용된 댓글 목록
	 */
	public List<DateComment> getCommList(HashMap<String, Object> map);

	/**
	 * 유저 번호 조회
	 * 
	 * @param id - 유저아이디 객체
	 * @return 유저번호
	 */
	public int getUserNo(String id);

	/**
	 * 삽입할 댓글 객체
	 * 
	 * @param comm - 삽입할 댓글 정보
	 */
	public void insertComm(DateComment comm);

	/**
	 * 댓글 번호에 맞는 댓글 수정
	 * 
	 * @param comm - 수정할 댓글 정보
	 */
	public void updateByCmNo(DateComment comm);

	/**
	 * 댓글 번호에 맞는 댓글정보 삭제
	 * 
	 * @param cmNo - 댓글번호
	 */
	public void delectByCmNo(DateComment cmNo);

	public int selectDatenoByCmNo(DateComment comm);

}
