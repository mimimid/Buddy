package web.dao.face.mypage;

import web.dto.AniUser;

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


}
