package web.dao.face.mypage;

public interface MypageDao {

	/**
	 * 유저 번호에 해당하는 유저 탈퇴
	 * 
	 * @param userno - 유저번호 객체
	 */
	public void deleteByUserno(int userno);

}
