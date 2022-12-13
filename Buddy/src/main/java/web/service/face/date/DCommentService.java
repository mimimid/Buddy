package web.service.face.date;

import java.util.List;

import web.dto.DateBoard;
import web.dto.DateComment;

public interface DCommentService {

	/**
	 * 
	 * 
	 * @param dateNo
	 * @return
	 */
	public List<DateComment> getList(DateBoard dateNo);

}
