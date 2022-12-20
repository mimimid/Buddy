package web.service.face.mypage;

import java.util.List;

import web.dto.AniUser;
import web.dto.QnaBoard;
import web.util.Paging;

public interface MypageService {

	/**
	 * 유저 번호에 맞는 유저 탈퇴
	 * 
	 * @param userno - 유저번호 객체
	 */
	public void deleteUser(int userno);

	/**
	 * 유저 번호에 맞는 회원 정보 수정
	 * 
	 * @param user - 유저번호, 수정된 유저정보
	 */
	public void updateUser(AniUser user);

	/**
	 * 해당 유저의 문의 게시글 목록 페이징 객체 생성
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @param userno - 유저 번호 객체
	 * @return
	 */
	public Paging getPaging(int curPage, int userno);

	/**
	 * 페이징이 적용된 해당 유저의 게시글 목록 조회
	 * 
	 * @param userno - 유저번호 객체
	 * @param paging - 페이징 정보 객체
	 * @return List<QnaBoard> - 게시판 리스트 목록
	 */
	public List<QnaBoard> list(int userno, Paging paging);

	/**
	 * 해당 유저가 작성한 게시글 수 조회
	 * 
	 * @param userno - 유저 번호 객체
	 * @return
	 */
	public int listCnt(int userno);

	public QnaBoard view(QnaBoard viewBoard);

	public void write(QnaBoard board);



}
