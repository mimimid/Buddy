package web.service.face.adopt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Report;
import web.dto.ReptFile;
import web.util.Paging;

public interface ReportService {


	/**
	 * 회계보고 전체 게시글 수를 구한다
	 * 
	 * @return int - 전체 게시글 수
	 */
	public int reptGetTotal();

	/**
	 * 회계보고내용 및 파일을 저장한다
	 * 
	 * @param report - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void reptWrite(Report report, MultipartFile file);
	
	/**
	 * 상세보기 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param report - 조회할 게시글 번호 객체
	 * @return 첨부파일 정보
	 */
	public ReptFile getReptViewFile(Report report);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param reptFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public ReptFile getFile(ReptFile reptFile);

	/**
	 * 게시글 상세보기
	 * 
	 * @param report - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Report ReptView(Report report);

	/**
	 * 회계보고내용 및 파일을 수정한다
	 * 
	 * @param report - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void reptUpdate(Report report, MultipartFile file);

	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param report
	 */
	public void reptDelete(Report report);

	/**
	 * 검색된 회계보고 목록 페이징
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @param reptTitle - 검색어
	 * @return
	 */
	public Paging getReptPaging(int curPage, String reptTitle);

	/**
	 * 페이징 적용된 회계보고,파일 목록
	 * 
	 * @param map - 검색어, 페이징 정보 객체
	 * @return
	 */
	public List<Map<String, Object>> reptPagingFileList(Map<String, Object> map);






	
}
