package web.dao.face.hospital;

import java.util.List;

import web.dto.HospBoard;
import web.dto.HospbCmt;
import web.dto.HospbFile;
import web.dto.HospbLike;
import web.dto.HospbPaging;
import web.dto.Hospital;

public interface HospBoardDao {

	
	//--- 게시판 ---- 

	/**
	 * 총 게시글 수 카운트
	 * 
	 * @param paramPaging
	 * @return int
	 */
	public int selectCntAll(HospbPaging hospbPaging);
	
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param hospbPaging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HospBoard> selectAll(HospbPaging hospbPaging);
	
	
	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */	
	public void updateHit(HospBoard viewBoard);

	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public HospBoard selectBoard(HospBoard viewBoard);

	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보 조회
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public HospbFile selectBoardFileByBoardNo(HospBoard viewBoard);


	public void insertBoard(HospBoard board);

	public void insertFile(HospbFile hospFile);

	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public HospbFile selectBoardFileByFileNo(HospbFile boardfile);
	

	public void updateBoard(HospBoard board);

	
	public void deleteHospBoardLike(Hospital hospital);
	public void deleteHospBoardCmt(Hospital hospital);
	public void deleteFile(HospBoard board);
	public void delete(HospBoard board);

	public int likeUp(HospbLike like);
	public int likeDown(HospbLike like);
	
	public List<HospbCmt> selectAllCmt(int hbno);

	
	public int insertCmt(HospbCmt hospbCmt);
	public int insertReCmt(HospbCmt hospbCmt);

	public int reCmtCnt(HospbCmt hospbCmt);
	public int deleteCmt(HospbCmt hospbCmt);

	public void cmtUp(HospBoard board);
	public void cmtDown(HospBoard board);


	
	

}
