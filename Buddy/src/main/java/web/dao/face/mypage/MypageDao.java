package web.dao.face.mypage;

import java.util.HashMap;
import java.util.List;

import web.dto.AniUser;
import web.dto.QnaBoard;

public interface MypageDao {

	/**
	 * 유저 번호에 해당하는 유저 탈퇴
	 * 
	 * @param userno - 유저번호 객체
	 */
	public void deleteByUserno(int userno);

	/**
	 * 유저 번호에 해당하는 유저 정보 수정
	 * 
	 * @param user - 유저번호, 수정된 유저정보
	 */
	public void updateByUserno(AniUser user);

	/**
	 * 유저 번호에 해당하는 게시글 개수 구하기
	 * 
	 * @param userno - 유저번호 객체
	 * @return int - 게시글 수
	 */
	public int selectCntAll(int userno);

	/**
	 * 페이징을 적용하여 해당 유저의 게시글 목록 조회
	 * 
	 * @param map - 유저번호, 페이징 객체
	 * @return List<QnaBoard> - 문의게시판 리스트 조회
	 */
	public List<QnaBoard> selectListByUserno(HashMap<String, Object> map);

	public QnaBoard selectBoard(QnaBoard viewBoard);

	public void insertBoard(QnaBoard board);
	
	
}
