package web.service.face.comm;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.CommBoard;
import web.dto.CommCmt;
import web.dto.CommFile;
import web.dto.CommLike;
import web.dto.CommReport;
import web.util.Paging;

public interface CommService {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @param animal - 동물 카테고리 정보 객체 (ani_cate)
	 * @param category - 내용 카테고리 정보 객체 (con_cate)
	 * @param searchType - 검색 유형 객체
	 * @param keyword - 검색 입력 객체
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage, String animal, String category, String searchType, String keyword);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param animal - 동물 카테고리 정보 객체 (ani_cate)
	 * @param category - 내용 카테고리 정보 객체 (con_cate)
	 * @param searchType  - 정렬 방식 객체
	 * @param keyword - 검색 입력 객체
	 * @return 페이징, 카테고리, 정렬방식, 검색객체가 적용된 게시글 목록
	 */
	public List<CommBoard> list(Paging paging, String animal, String category, String searchType, String keyword);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public CommBoard view(CommBoard viewBoard);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param commBoard - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(CommBoard commBoard, MultipartFile file);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public CommFile getAttachFile(CommBoard viewBoard);
	
	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param commFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public CommFile getFile(CommFile commFile);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param commBoard - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(CommBoard commBoard, MultipartFile file);

	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param commBoard - 삭제할 게시글 정보 객체
	 */
	public void delete(CommBoard commBoard);

	
	//----- 좋아요 ---------------------------------------------------------
	
	/**
	 * 게시글 번호와 회원번호를 통한 좋아요 여부 조회
	 * 
	 * @param viewBoard - 게시글 정보 객체
	 * @param userno - 회원 정보 객체
	 * @return 좋아요 여부
	 */
	public int findLike(CommBoard viewBoard, int userno);
	
	/**
	 * 회원 번호를 통한 좋아요 추가
	 * 
	 * @param like - 회원 정보 객체
	 */
	public void likeUp(CommLike like);

	/**
	 * 회원 번호를 통한 좋아요 삭제
	 * 
	 * @param like - 회원 정보 객체
	 */
	public void likeDown(CommLike like);
	
	
	//----- 댓글 ---------------------------------------------------------
	
	/**
	 * 게시글 번호를 이용하여 댓글 목록 조회
	 * 
	 * @param commNo - 게시글 번호 객체
	 * @return
	 */
	public List<CommCmt> cmtList(int commNo);

	/**
	 * 댓글 작성
	 * 
	 * @param commCmt - 댓글 정보 객체
	 */
	public void cmtWrite(CommCmt commCmt);

	/**
	 * 댓글 삭제
	 * 
	 * @param commCmt - 삭제할 댓글 정보 객체
	 */
	public void cmtDelete(CommCmt commCmt);

	/**
	 * 게시글 신고
	 * 
	 * @param commReport - 작성자 정보
	 */
	public void report(CommReport commReport);

	public List<CommBoard> rlist();

	public List<CommBoard> plist();

	

	








}
