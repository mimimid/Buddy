package web.service.face.notice;

import java.util.HashMap;
import java.util.List;

public interface NlikeService {
	
	public void likeNotice(HashMap<String, Object> param);
	
	public void deleteLike(HashMap<String, Object> param);
	
	public Boolean findLike(int boardno, String userId);

}
