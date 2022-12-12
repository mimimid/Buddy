package web.service.face.hospital;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

import web.dto.HospBoard;
import web.dto.HospbCmt;
import web.dto.HospbFile;
import web.dto.HospbLike;
import web.dto.HospbPaging;

public interface HospBoardService {


	public HospbPaging getPaging(String animal, String category, String searchType, String keyWord, int curPage);

	public List<HospBoard> list(HospbPaging hospbPaging);
	
	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	HospBoard view(HospBoard viewBoard);


	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 첨부파일 정보
	 */	
	public HospbFile getAttachFile(HospBoard viewBoard);

	
	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(HospBoard board, MultipartFile file);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(HospBoard board, MultipartFile file);

	
	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param board
	 */
	public void delete(HospBoard board);


	public int findLike(HospBoard viewBoard, int userno);

	public void likeUp(HospbLike like);
	
	public void likeDown(HospbLike like);

	public List<HospbCmt> cmtList(int hbno);


	public void cmtWrite(HospbCmt hospbCmt);


	public void cmtDelete(HospbCmt hospbCmt);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param hospbfile - 조회할 파일 번호 객체
	 * @return
	 */
	public HospbFile getFile(HospbFile hospbfile);

	


	
	

	

}
