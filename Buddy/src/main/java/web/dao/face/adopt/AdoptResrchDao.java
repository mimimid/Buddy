package web.dao.face.adopt;

import java.util.List;
import java.util.Map;

import web.dto.AdoptResearch;
import web.dto.AdoptResrchFile;
import web.util.Paging;

public interface AdoptResrchDao {

	/**
	 * 입양신청서 답변을 삽입한다
	 * 
	 * @param adoptResearch - 신청서 답변 객체
	 */
	public void insertResearch(AdoptResearch adoptResearch);

	/**
	 * 입양신청서 파일을 삽입한다
	 * 
	 * @param adoptResrchFile - 신청서 파일 객체
	 */
	public void insertResrchFile(AdoptResrchFile adoptResrchFile);

	/**
	 * 입양신청서 전체 게시글 수 조회
	 * 
	 * @return 총 게시글 수
	 */
	public int selectResrchCntAll();

	/**
	 * 페이징 적용하여 입양신청서 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징된 입양신청서 목록
	 */
	public List<AdoptResearch> selectResrchList(Paging paging);

	/**
	 * 조회하려는 신청서의 조회수를 1 증가시킨다
	 * 
	 * @param viewResearch - 조회된 신청서 번호
	 */
	public void updateAnswerHit(AdoptResearch viewResearch);

	/**
	 * 신청서 번호를 이용하여 신청서를 조회한다
	 * 
	 * @param viewResearch - 조회하려는 신청서 번호
	 * @return 조회된 신청서 정보
	 */
	public AdoptResearch selectResrchView(AdoptResearch viewResearch);

	/**
	 * 신청서 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewResearch - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public List<AdoptResrchFile> selectResrchFile(AdoptResearch viewResearch);

	/**
	 * 신청 서류 상태를 업데이트한다
	 * 
	 * @param checking - 업데이트할 신청서 정보
	 */
	public void updateResrchChecking(Map<String, Object> map);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param adoptResrchFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public AdoptResrchFile selectResrchFileByFileNo(AdoptResrchFile adoptResrchFile);

}
