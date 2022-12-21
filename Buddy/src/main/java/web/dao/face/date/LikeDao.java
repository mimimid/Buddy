package web.dao.face.date;

import web.dto.DateBoard;
import web.dto.DateLike;

public interface LikeDao {

	/**
	 * 데이트 번호와 회원번호와 일치하는 좋아요 조회
	 * 
	 * @param like - 게시글 번호, 회원번호 정보 객체
	 * @return 좋아요 체크
	 */
	public int selectLike(DateLike like);

	/**
	 * 좋아요 추가
	 * 
	 * @param like - 게시글번호, 회원번호 객체
	 * @return INSERT ( 1 - 성공, 0 - 실패 )
	 */
	public int insertLike(DateLike like);

	/**
	 * 좋아요 수 증가
	 * 
	 * @param date - 게시글 번호
	 */
	public void likeCntUp(DateBoard date);

	/**
	 * 좋아요 개수 구하기
	 * 
	 * @param like - 게시글 번호
	 * @return 좋아요 수 컬럼
	 */
	public DateBoard selectLikeCntByDateNo(DateLike like);

	/**
	 * 좋아요 삭제
	 * 
	 * @param like - 게시글 번호, 회원 번호
	 * @return DELETE ( 1 - 성공, 0 - 실패 )
	 */
	public int deleteLike(DateLike like);

	/**
	 * 좋아요 수 감소
	 * 
	 * @param date - 게시글 번호
	 */
	public void likeCntDown(DateBoard date);

}
