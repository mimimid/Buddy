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
	
	public HospBoard view(HospBoard viewBoard);

	public HospbFile getAttachFile(HospBoard viewBoard);

	public void write(HospBoard board, MultipartFile file);

	public void update(HospBoard board, MultipartFile file);

	public void delete(HospBoard board);

	public void likeUp(HospbLike like);
	
	public void likeDown(HospbLike like);

	public List<HospbCmt> cmtList(int hbno);

	public void cmtWrite(HospbCmt hospbCmt);

	public void cmtDelete(HospbCmt hospbCmt);

	public HospbFile getFile(HospbFile hospbfile);

	


	
	

	

}
