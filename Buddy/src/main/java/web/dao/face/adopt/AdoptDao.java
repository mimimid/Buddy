package web.dao.face.adopt;

import java.util.List;
import java.util.Map;

import web.dto.AdoptCmt;
import web.dto.AdoptFile;
import web.dto.AdoptPro;
import web.dto.AdoptResrchFile;
import web.dto.AdoptWish;
import web.util.Paging;

public interface AdoptDao {

	/**
	 * 카테고리별 전체 게시글 수를 조회한다
	 * @param aniCate - 카테고리 정보 객체
	 * 
	 * @return 총 게시글 수
	 */
	public int selectProCntAll(String aniCate);

	/**
	 * 페이징을 적용하여 카테고리별 입양프로필 목록 조회
	 * 
	 * @param map - 페이징 정보 객체 , 카테고리 정보 객체
	 * @return 페이징이 적용된 입양프로필 목록
	 */
	public List<Map<String, Object>> selectProList(Map<String, Object> map);

	/**
	 * 찜하기 여부 체크
	 * 
	 * @param adoptWish 찜 정보 객체
	 * @return
	 */
	public int checkProWish(AdoptWish adoptWish);

	/**
	 * 찜 추가
	 * 
	 * @param adoptWish 찜 정보 객체
	 */
	public void insertProWish(AdoptWish adoptWish);

	/**
	 * 찜 삭제
	 * 
	 * @param adoptWish 찜 정보 객체
	 */
	public void deleteProWish(AdoptWish adoptWish);

	/**
	 * 찜 전체조회
	 * 
	 * @return 찜 전체 목록
	 */
	public List<AdoptWish> selectProWishAll();

	/**
	 * 회원이 찜한 목록 조회
	 * 
	 * @param userno 회원 번호
	 * @return
	 */
	public List<AdoptWish> selectUserWish(int userno);

	/**
	 * 회원이 찜한 입양프로필 조회
	 * 
	 * @param aniNo 입양프로필 번호
	 * @return
	 */
	public Map<String, Object> selectProWish(int aniNo);

	/**
	 * 회원이 찜한 입양프로필 개수 조회
	 * 
	 * @param userno 회원 번호
	 * @return
	 */
	public int selectWishCount(int userno);

	/**
	 * 입양프로필 정보를 삽입한다
	 * 
	 * @param report - 삽입할 게시글 정보
	 */
	public void insertPro(AdoptPro adoptPro);

	/**
	 * 입양프로필 파일을 삽입한다
	 * 
	 * @param adoptResrchFile - 프로필 파일 객체
	 */
	public void insertAdoptFile(AdoptFile adoptFile);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param adoptFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public AdoptFile selectAdoptFileByFileNo(AdoptFile adoptFile);

	/**
	 * 조회하려는 프로필의 조회수를 1 증가시킨다
	 * 
	 * @param adoptPro - 조회된 프로필 번호
	 */
	public void updateAdoptHit(AdoptPro adoptPro);

	/**
	 * 프로필 번호를 이용하여 프로필을 조회한다
	 * 
	 * @param adoptPro - 조회하려는 프로필 번호
	 * @return 조회된 프로필 정보, 찜여부
	 */
	public Map<String, Object> selectAdoptView(AdoptPro adoptPro);

	/**
	 * 프로필 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param adoptPro - 조회할 프로필 번호
	 * @return 조회된 첨부파일 정보
	 */
	public List<AdoptFile> selectAdoptFile(AdoptPro adoptPro);

	/**
	 * 입양프로필 정보를 수정한다
	 * 
	 * @param adoptPro - 수정할 입양프로필 정보
	 */
	public void updatePro(AdoptPro adoptPro);

	/**
	 * 수정 전 입양프로필 첨부파일을 모두 삭제
	 * 
	 * @param adoptPro - 첨부파일을 삭제할 프로필 번호
	 */
	public void deleteAdoptfile(AdoptPro adoptPro);

	/**
	 * 입양프로필 삭제
	 * 
	 * @param report - 삭제할 프로필 번호
	 */
	public void deleteAdoptPro(AdoptPro adoptPro);

	/**
	 * 이전,이후 목록 조회
	 * 
	 * @param rnum - 선택한 입양프로필 행번호
	 * @return
	 */
	public List<Map<String, Object>> selectRnumView(int rnum);

	/**
	 * 입양프로필 댓글을 삽입한다
	 * 
	 * @param adoptCmt - 삽입할 댓글 객체
	 */
	public void insertCmt(AdoptCmt adoptCmt);

	/**
	 * 입양프로필의 댓글 리스트를 조회한다
	 * 
	 * @param adoptPro - 입양프로필 번호
	 * @return
	 */
	public List<AdoptCmt> selectAdoptCmtView(AdoptPro adoptPro);

	/**
	 * 전체 댓글 수 
	 * 
	 * @return 입양프로필 댓글 수
	 */
	public int selectCmtCntAll(AdoptPro adoptPro);

	/**
	 * 댓글 삭제
	 * 
	 * @param adoptCmt - 댓글 번호
	 */
	public void deleteCmt(AdoptCmt adoptCmt);

	/**
	 * 댓글 수정
	 * 
	 * @param adoptCmt - 댓글 수정
	 */
	public void updateCmt(AdoptCmt adoptCmt);

	/**
	 * 답글 삽입 전 sort + 1
	 * 
	 * @param adoptCmt - 답글 내용 및 원글 정보
	 */
	public void updateSort(AdoptCmt adoptCmt);

	/**
	 * 답글 삽입
	 * 
	 * @param adoptCmt - 답글 내용 및 원글 정보
	 */
	public void insertReCmt(AdoptCmt adoptCmt);



}
