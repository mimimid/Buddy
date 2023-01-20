package web.service.face.date;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dto.DateBoard;
import web.dto.DateComment;
import web.dto.DateReport;
import web.util.Paging;

@Service
public interface DateService {

	/**
	 * 게시글 목록 조회
	 * 
	 * @return 게시글 목록
	 */
	public List<DateBoard> list();

	/**
	 * 조회순 목록 조회
	 * 
	 * @return 게시글 목록
	 */
	public List<DateBoard> hitList();

	/**
	 * 게시글 목록 페이징 객체 생성
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @param category - 카테고리 정보 객체
	 * @param keywoard - 검색입력 객체
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage, int category, String keywoard);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param category - 카테고리 정보 객체
	 * @param sort - 정렬방식 객체
	 * @param keywoard - 검색입력 객체
	 * @return 페이징, 카테고리, 정렬방식, 검색객체가 적용된 게시글 목록
	 */
	public List<DateBoard> list(Paging paging, int category, String sort, String keywoard);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewDate - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public DateBoard view(DateBoard viewDate);

	/**
	 * 데이트게시판의 댓글수 업데이트
	 * 
	 * @param viewDate - 상세 조회한 게시글 번호 객체
	 */
	public void updateCommCount(DateBoard viewDate);

	/**
	 * 데이트게시판의 좋아요수 업데이트
	 * 
	 * @param viewDate - 상세 조회한 게시글 번호 객체
	 */
	public void updateLikeCount(DateBoard viewDate);

	/**
	 * 해당 게시글의 신고를 한 유저 정보 업데이트
	 * 
	 * @param report - 게시글번호, 유저번호, 신고내용
	 */
	public void report(DateReport report);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(DateBoard board, MultipartFile file);




}
