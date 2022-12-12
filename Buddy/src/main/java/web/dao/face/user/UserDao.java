package web.dao.face.user;

import web.dto.AniUser;
import web.dto.AniUserImg;

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

	/**
	 * 회원가입 처리
	 * @param user
	 */
	public void insertUser(AniUser user);

	/**
	 * 프로필 사진 처리
	 * @param aniUserImg
	 */
	public void insertImg(AniUserImg aniUserImg);

	/**
	 * 이름과 전화번호로 아이디 찾기
	 * @param user
	 * @return
	 */
	public String selectIdByNamePhone(AniUser user);

	/**
	 * 아이디 이름 전화번호로 비밀번호 찾기
	 * @param user
	 * @return
	 */
	public String selectPwByIdNamePhone(AniUser user);

}
