package web.dao.face.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Notice;
import web.util.Paging;


public interface NoticeDao {
	
	//공지사항 글 no 가져오기
	public int selectNextBoardNo();

	//공지사항 조회수 +1 올리기
	public void updateView(int boardno);
	
	//공지사항 좋아요 +1 올리기
	public void updateLike(int boardno);
	
	//공지사항 글 작성하기
	public void insert(Notice board);
	
	public int nextseq();
	
	//boardno을 매개로 board와 boardfile을 조인해서 찾음
	public List<HashMap<String, Object>> selectByNo(int noticeno);

	//조회수 +1 올리기
	public void hit(int noticeno);

	public int selectCntAll();

	public List<Map<String, Object>> selectList(Paging paging);

	public int selectCntAllSearch(String keyword);

	public List<Map<String, Object>> selectSearchList(@Param("paging") Paging paging, @Param("keyword")String keyword);

	
	
}
