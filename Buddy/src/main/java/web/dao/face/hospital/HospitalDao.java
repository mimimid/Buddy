package web.dao.face.hospital;

import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;

import java.util.List;

import web.dto.Hospital;

public interface HospitalDao {

	
	/**
	 * 총 게시글 수 카운트
	 * 
	 * @param paramPaging
	 * @return
	 */
	public int selectCntAll(HospitalPaging paramPaging);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param hospitalPaging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Hospital> selectAll (HospitalPaging hospitalPaging);

	/**
	 * 병원 번호를 이용하여 병원 상세 조회
	 * 
	 * @param viewHospital 병원 정보
	 */
	public Hospital selectHospital(Hospital viewHospital);

	public HospitalPic selectHospPicByHospNo(Hospital viewHospital);

	public void insertHospital(Hospital hospital);
	public void insertPic(HospitalPic hospitalPic);

	
	public int likeUp(HospitalLike like);
	public int likeDown(HospitalLike like);

	public void insertApiData(Hospital hospital);

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
