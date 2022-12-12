package web.dao.face.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Ncomment;


public interface NcommentDao {
	
	public void insert(Ncomment ncomment);
	
	public List<HashMap<String, Object>> findcmts(int noticeno, String userId);
	
	public void update(Ncomment bcomment);

	public List<HashMap<String, Object>> selectAllByRecent(int noticeno);

	public List<HashMap<String, Object>> selectAllByLike(int noticeno);

	public List<Map<String, Object>> selectLikeCmts(@Param("userid")String userid,  @Param("noticeno")int noticeno);

	public void insertLike(@Param("ncmtno")int ncmtno,  @Param("userid")String userid);

	public void deleteLike(@Param("ncmtno")int ncmtno);

	public void delete(Ncomment ncomment);
	

}
