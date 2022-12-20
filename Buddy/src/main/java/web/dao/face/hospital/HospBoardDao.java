package web.dao.face.hospital;

import java.util.List;

import web.dto.HospBoard;
import web.dto.HospbCmt;
import web.dto.HospbFile;
import web.dto.HospbLike;
import web.dto.HospbPaging;
import web.dto.Hospital;

public interface HospBoardDao {


	public int selectCntAll(HospbPaging hospbPaging);
	
	public List<HospBoard> selectAll(HospbPaging hospbPaging);
	
	public void updateHit(HospBoard viewBoard);

	public HospBoard selectBoard(HospBoard viewBoard);


	public HospbFile selectBoardFileByBoardNo(HospBoard viewBoard);

	public void insertBoard(HospBoard board);

	public void insertFile(HospbFile hospFile);

	public HospbFile selectBoardFileByFileNo(HospbFile boardfile);
	public void updateBoard(HospBoard board);

	public void deleteHospBoardLike(Hospital hospital);
	public void deleteHospBoardCmt(Hospital hospital);
	public void deleteFile(HospBoard board);
	public void delete(HospBoard board);

	public int likeUp(HospbLike like);
	public int likeDown(HospbLike like);
	
	public List<HospbCmt> selectAllCmt(int hbno);
	
	public int insertCmt(HospbCmt hospbCmt);
	public int insertReCmt(HospbCmt hospbCmt);

	public int reCmtCnt(HospbCmt hospbCmt);
	public int deleteCmt(HospbCmt hospbCmt);



	
	

}
