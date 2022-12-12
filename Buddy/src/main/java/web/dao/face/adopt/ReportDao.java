package web.dao.face.adopt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.Report;
import web.dto.ReptFile;
import web.util.Paging;

public interface ReportDao {

	/**
	 * 회계보고 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int reptSelectCntAll();

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param report - 삽입할 게시글 정보
	 */
	public void insertReport(Report report);


	/**
	 * 파일 정보를 삽입한다
	 * 
	 * @param reptFile - 삽입할 파일 정보
	 */
	public void insertReptFile(ReptFile reptFile);

	/**
	 * 상세보기 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param report - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ReptFile selectReptFileByReptNo(Report report);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param reptFile  - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public ReptFile selectReptFileByRfileNo(ReptFile reptFile);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param report - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Report selectRept(Report report);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param report - 수정할 게시글 정보
	 */
	public void updateReport(Report report);

	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param report - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteReptfile(Report report);

	/**
	 * 게시글 삭제
	 * @param report - 삭제할 게시글 번호
	 */
	public void deleteReport(Report report);


	/**
	 * 검색된 회계보고 전체 게시글 수 조회
	 * 
	 * @param reptTitle - 검색어
	 * @return 검색 게시글 수
	 */
	public int selectReptCntAll(String reptTitle);


	/**
	 * 검색된 회계보고,파일 목록 페이징 적용
	 * 
	 * @param reptList - 검색어, 페이징 정보 객체
	 * @return
	 */
	public List<Map<String, Object>> selectReptPagingList(Map<String, Object> map);


	

}
