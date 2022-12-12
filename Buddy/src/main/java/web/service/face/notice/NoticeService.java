package web.service.face.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.Notice;
import web.util.Paging;


public interface NoticeService {
	
	public void write(Notice notice);
	
	public int getNextNoticeno();
	//boardno을 매개로 board와 boardfile을 조인해서 찾음
	public List<HashMap<String, Object>> findByNo(int boardno);

	public void view(int noticeno);

	public Paging getPaging(int curPage);

	public List<Map<String, Object>> list(Paging paging);

	public Paging getPagingSearch(int curPage, String keyword);

	public List<Map<String, Object>> search(Paging paging, String keyword);




}
