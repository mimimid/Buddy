package web.service.face.date;

import java.util.List;

import web.dto.DateBoard;
import web.dto.DateComment;
import web.util.Paging;

public interface DCommentService {
	
	/**
	 * 댓글 목록 페이징 객체 생성
	 * 
	 * @param curPage - 요청 페이징 번호
	 * @param dateNo - 조회된 게시글 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getCommPaging(int curPage, DateBoard dateNo);

	/**
	 * 댓글 목록 조회
	 * 
	 * @param paging - 페이징 객체 
	 * @param dateNo - 조회된 게시글 번호
	 * @return 댓글 목록 조회 처리
	 */
	public List<DateComment> getCommList(Paging paging, DateBoard dateNo);

	/**
	 * 유저 번호 조회
	 * 
	 * @param id - 유저 아이디 객체
	 * @return 유저 번호
	 */
	public int getuserNo(String id);

	/**
	 * 댓글 삽입
	 * 
	 * @param comm - 삽입할 댓글 정보
	 */
	public void commWrite(DateComment comm);

	/**
	 * 댓글 수정
	 * 
	 * @param comm - 수정할 댓글 정보
	 */
	public void updateComm(DateComment comm);

	/**
	 * 댓글 수정이 이루어진 게시글 번호 조회
	 * 
	 *  @param comm - 댓글 번호 객체
	 * @return dateNo - 게시글 번호
	 */
	public int selectDateno(DateComment comm);

	/**
	 * 댓글 삭제
	 * 
	 * @param cmNo - 삭제할 댓글 정보
	 */
	public void deleteComm(DateComment cmNo);

}
