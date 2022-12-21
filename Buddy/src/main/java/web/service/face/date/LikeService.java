package web.service.face.date;

import web.dto.DateBoard;
import web.dto.DateLike;

public interface LikeService {

	/**
	 * 데이트 번호와 회원번호와 일치하는 좋아요 조회
	 * 
	 * @param viewDate - 게시글 정보 객체
	 * @param userno - 회원 번호
	 * @return 좋아요 체크
	 */
	public int ckLike(DateBoard viewDate, int userno);

	/**
	 * 회원번호로 좋아요 추가
	 * 
	 * @param like - 회원번호 객체
	 */
	public void insertLike(DateLike like);

	/**
	 * 해당 게시글의 좋아요 개수 가져오기
	 * 
	 * @param like - 게시글 번호
	 * @return 좋아요수 컬럼
	 */
	public DateBoard likeCnt(DateLike like);

	/**
	 * 회원 번호로 좋아요 취소
	 * 
	 * @param like - 회원 번호 객체
	 */
	public void hate(DateLike like);

}
