package web.dao.face.user;

import web.dto.AniUser;

public interface UserDao {

	/**
	 * 로그인 정보 조회
	 * @param user
	 * @return
	 */
	public int selectCntByIdPw(AniUser user);

	/**
	 * 아이디로 유저 정보 조회
	 * @param user
	 * @return
	 */
	public AniUser selectAllById(AniUser user);

	/**
	 * 중복아이디 체크
	 * @param userid
	 * @return
	 */
	public int selectCntById(String userid);

}
