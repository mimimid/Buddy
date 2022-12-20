package web.service.face.mypage;

import web.dto.AniUser;

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


}
