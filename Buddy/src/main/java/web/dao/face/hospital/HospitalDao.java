package web.dao.face.hospital;

import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;

import java.util.List;

import web.dto.Hospital;

public interface HospitalDao {


	public int selectCntAll(HospitalPaging paramPaging);

	public List<Hospital> selectAll (HospitalPaging hospitalPaging);

	public Hospital selectHospital(Hospital viewHospital);
	public HospitalPic selectHospPicByHospNo(Hospital viewHospital);

	public void insertHospital(Hospital hospital);
	public void insertPic(HospitalPic hospitalPic);

	public int likeUp(HospitalLike like);
	public int likeDown(HospitalLike like);

	public List<HospitalReview> selectAllReview(int hospNo);

	public int insertReview(HospitalReview hospReview);
	public int deleteReview(HospitalReview hospReview);
	public void reviewRateUpdate(Hospital hospital);
	
	public int reviewLikeUp(HospitalReviewLike reviewLike);
	public int reviewLikeDown(HospitalReviewLike reviewLike);

	public void updateHospital(Hospital hospital);
	public void deleteHospLike(Hospital hospital);
	public void deleteHospReview(Hospital hospital);
	public void deleteHospPic(Hospital hospital);
	public void deleteHospital(Hospital hospital);








}
