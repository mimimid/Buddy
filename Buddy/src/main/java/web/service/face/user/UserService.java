package web.service.face.user;

import org.springframework.web.multipart.MultipartFile;

import web.dto.AniUser;

public interface UserService {

	/**
	 *  입력받은 id, pw 확인하여 로그인처리
	 * @param user
	 * @return
	 */
	public boolean login(AniUser user);

	/**
	 * 로그인한 유저의 정보 가저오기
	 * @param user
	 * @return
	 */
	public AniUser getUserInfo(AniUser user);

	/**
	 * 중복 id 체크 
	 * @param userid 
	 * @return 중복아이디 체크 true - 아이디 존재 false - 아이디 없음
	 */
	public boolean idCheck(String userid);
	/**
	 * 회원가입 처리
	 * @param user 회원가입 정보
	 * @param img 회원가입 이미지
	 * @return
	 */
	public boolean join(AniUser user);

	/**
	 * 프로필 이미지 처리
	 * @param img
	 */
	public void insertImg(AniUser user, MultipartFile img);

	/**
	 * 아이디 찾기
	 * @param user
	 * @return
	 */
	public String findId(AniUser user);

	/**
	 * 비밀번호 찾기
	 * @param user
	 * @return
	 */
	public String findPw(AniUser user);

	

	


}
