package web.dao.face.date;

import java.util.List;

import web.dto.DateBoard;
import web.dto.DateComment;

public interface DCommentDao {

	/**
	 * 
	 * 
	 * @param dateNo
	 * @return
	 */
	public List<DateComment> getList(DateBoard dateNo);

}
