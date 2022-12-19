package web.dao.face.comm;

import java.util.HashMap;
import java.util.List;

import web.dto.CommBoard;
import web.dto.CommCmt;
import web.dto.CommFile;
import web.dto.CommLike;
import web.dto.CommReport;

public interface CommDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param map
	 * @return
	 */
	public int selectCntAll(HashMap<String, Object> map);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param map
	 * @return
	 */
	public List<CommBoard> selectList(HashMap<String, Object> map);
	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */
	public void updateHit(CommBoard viewBoard);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public CommBoard selectBoard(CommBoard viewBoard);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param commBoard - 삽입할 게시글 정보
	 */
	public void insertCommBoard(CommBoard commBoard);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param commFile - 삽입할 첨부파일 정보
	 */
	public void insertCommFile(CommFile commFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public CommFile selectCommFileByCommNo(CommBoard viewBoard);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다 
	 * 
	 * @param commFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public CommFile selectCommFileByCommFileNo(CommFile commFile);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param commBoard - 수정할 게시글 정보
	 */
	public void updateCommBoard(CommBoard commBoard);

	/**
	 * 게시글을 참조하고 있는 모든 좋아요 삭제
	 * 
	 * @param commBoard - 좋아요를 삭제할 게시글 번호
	 */
	public void deleteAllLike(CommBoard commBoard);
	
	/**
	 * 게시글을 참조하고 있는 모든 댓글 삭제
	 * 
	 * @param commBoard - 댓글을 삭제할 게시글 번호
	 */
	public void deleteAllCmt(CommBoard commBoard);
	
	/**
	 * 게시글을 참조하고 있는 모든 신고 삭제
	 * 
	 * @param commBoard - 신고를 삭제할 게시글 번호
	 */
	public void deleteAllReport(CommBoard commBoard);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param commBoard - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteCommFile(CommBoard commBoard);

	/**
	 * 게시글 삭제
	 * 
	 * @param commBoard - 삭제할 게시글 번호
	 */
	public void delete(CommBoard commBoard);

	
	//----- 좋아요 ---------------------------------------------------------
	
	/**
	 * 게시글 번호와 회원번호를 통한 좋아요 여부 조회
	 * 
	 * @param like - 게시글 번호, 회원번호 정보 객체
	 * @return
	 */
	public int findLike(CommLike like);
	
	/**
	 * 좋아요 추가
	 * 
	 * @param like - 게시글 번호 객체
	 * @return 좋아요 추가 여부(추가 성공 - 1, 추가 실패 - 0 )
	 */
	public int likeUp(CommLike like);
	
	/**
	 * 좋아요 수 추가
	 * 
	 * @param board - 게시글 번호 객체
	 */
	public void likeCntUp(CommBoard board);
	
	/**
	 * 좋아요 취소
	 * 
	 * @param like - 게시글 번호 객체
	 * @return 좋아요 취소 여부(추가 성공 - 1, 추가 실패 - 0 )
	 */
	public int likeDown(CommLike like);
	
	/**
	 * 좋아요 수 감소
	 * 
	 * @param board - 게시글 번호 객체
	 */
	public void likeCntDown(CommBoard board);
	
	
	//----- 댓글 ---------------------------------------------------------
	
	/**
	 * 게시글 번호를 이용하여 전체 댓글 수를 조회한다
	 * 
	 * @param commNo - 게시글 번호 객체
	 * @return
	 */
	public List<CommCmt> selectAllCmt(int commNo);

	/**
	 * 댓글 정보를 삽입한다(댓글그룹이 없을 경우)
	 * 
	 * @param commCmt - 삽입할 댓글 정보
	 * @return 댓글 삽입 여부(삽입 성공 - 1, 삽입 실패 - 0 )
	 */
	public int insertCmt(CommCmt commCmt);

	/**
	 * 댓글 정보를 삽입한다(댓글그룹이 있을 경우)
	 * 
	 * @param commCmt - 삽입할 댓글 정보
	 * @return 댓글 삽입 여부(삽입 성공 - 1, 삽입 실패 - 0 )
	 */
	public int insertReCmt(CommCmt commCmt);

	/**
	 * 댓글을 작성하는 게시글의 댓글 수를 1 증가시킨다
	 * 
	 * @param board - 게시글의 댓글 수
	 */
	public void cmtUp(CommBoard commBoard);

	/**
	 * 게시글의 전체 댓글 수를 조회한다
	 * 
	 * @param commBoard
	 */
	public void cmtCnt(CommBoard commBoard);

	public int deleteCmt(CommCmt commCmt);

	public void cmtDown(CommBoard commBoard);

	/**
	 * 신고 작성
	 * 
	 * @param commReport - 신고 정보 객체
	 */
	public void report(CommReport commReport);

	
	public List<CommBoard> selectRList();

	public List<CommBoard> selectPList();

	public CommBoard selectLikeCnt(CommLike like);

	

	

	

	









}
