package web.dao.face.hospital;

import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;

import java.util.HashMap;
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
		
	public List<HashMap<String, Object>> selectHospLikeAll(int usernoParam);

	/**
	 * 병원 번호를 이용하여 병원 상세 조회
	 * 
	 * @param viewHospital 병원 정보
	 */
	public Hospital selectHospital(Hospital viewHospital);

	public HospitalPic selectHospPicByHospNo(Hospital viewHospital);
	
	public int findLike(HospitalLike like);

	public int likeUp(HospitalLike like);
	public int likeDown(HospitalLike like);

	public void likeCntUp(Hospital hospital);
	public void likeCntDown(Hospital hospital);

	public void insertApiData(Hospital hospital);


	public List<HospitalReview> selectAllReview(int hospNo);
	public List<HospitalReview> selectAllReviewLikeSort(int hospNo);

	public int insertReview(HospitalReview hospReview);
	public void reviewCntUp(Hospital hospital);

	public int deleteReview(HospitalReview hospReview);
	public void reviewCntDown(Hospital hospital);

	public void reviewRateUpdate(Hospital hospital);

	public List<HospitalReviewLike> selectAllReviewLike(int hospNo);

	public int findReviewLike (HospitalReviewLike reviewLike);
	public int reviewLikeUp(HospitalReviewLike reviewLike);
	public void reviewLikeCntUp(HospitalReview hospReview);

	public int reviewLikeDown(HospitalReviewLike reviewLike);
	public void reviewLikeCntDown(HospitalReview hospReview);
	
	public int getReviewLikeCnt(HospitalReview hospReview);
	
	public int selectReviewLikeCnt(int hospReviewNo);

	public void insertHospital(Hospital hospital);

	public void insertPic(HospitalPic hospitalPic);


	public void updateHospital(Hospital hospital);

	public void deleteHospLike(Hospital hospital);
	public void deleteHospReviewLike(Hospital hospital);
	
	public void deleteHospReview(Hospital hospital);

	public void deleteHospPic(Hospital hospital);

	public void deleteHospital(Hospital hospital);








}
