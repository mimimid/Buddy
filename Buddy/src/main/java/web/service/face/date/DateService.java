package web.service.face.date;

import java.util.List;

import org.springframework.stereotype.Service;

import web.dto.DateBoard;
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

//	/**
//	 * 게시글 목록 페이징 객체 생성
//	 * 
//	 * 파라미터 curPage(현재 페이지)
//	 * DB에서 조회한 totalCount(총 게시글 수)
//	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
//	 * 
//	 * @param curPage - 요청 페이지 번호
//	 * @return 계산이 완료된 Paging 객체
//	 */
//	public Paging getPaging(int curPage);
//
//	/**
//	 * 페이징이 적용된 게시글 목록 조회
//	 * 
//	 * @param paging - 페이징 정보 객체
//	 * @return 페이징이 적용된 게시글 목록
//	 */
//	public List<DateBoard> list(Paging paging);
	
	

}
