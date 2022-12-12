package web.service.face.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.notice.Ncomment;

public interface NcommentService {
	
	public void write(Ncomment bcomment);
	
	public List<HashMap<String, Object>> findLikedCmts(int boardno, String userId);
	
	public void modify(Ncomment bcomment);

	public List<HashMap<String, Object>> listByRecent(int boardno);

	public List<HashMap<String, Object>> listByLike(int boardno);
	
	public List<Map<String, Object>> likedCmtNo(String userid, int noticeno);

	public void like(int ncmtno, String userid);

	public void disLike(int ncmtno);

	public void delete(Ncomment bcomment);


}
