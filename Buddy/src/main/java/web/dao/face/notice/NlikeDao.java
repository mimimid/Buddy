package web.dao.face.notice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NlikeDao {
	
	public void insertNlike(HashMap<String, Object> param);
	
	public void deleteNlike(HashMap<String, Object> param);
	
	public int findNlike(@Param("noticeno")int noticeno, @Param("userId")String userId);


}
