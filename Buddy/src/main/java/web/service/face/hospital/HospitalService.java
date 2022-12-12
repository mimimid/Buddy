package web.service.face.hospital;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Hospital;
import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;

public interface HospitalService {

	
	
	public void insertHospApiData(Hospital hospital);
	

	public HospitalPaging getPaging(String hour24, String searchType, String keyWord, int curPage);
	

	public List<Hospital> list(HospitalPaging hospitalPaging);
	

	public Hospital view(Hospital viewHospital);


	int findLike(Hospital viewHospital, int userno);

	public void likeUp(HospitalLike like);
	
	public void likeDown(HospitalLike like);

	public List<HospitalReview> reviewList(int hospNo, String sort);

	public void reviewWrite(HospitalReview hospReview);

	public void reviewDelete(HospitalReview hospReview);

	

	public void write(Hospital hospital, MultipartFile file);
	
	/**
	 * 병원 번호를 이용하여 업로드된 사진파일 정보를 조회한다
	 * 
	 * @param viewHospital - 조회할 병원 번호 객체
	 * @return 첨부파일 정보
	 */
	public HospitalPic getAttachPic(Hospital viewHospital);
	
	
	public void update(Hospital hospital, MultipartFile file);
	
	public void delete(Hospital hospital);

	public List<HospitalReviewLike> reviewLikeList(int hospNo);
	
	public void reviewLikeUp(HospitalReviewLike reviewLike);
	public void reviewLikeDown(HospitalReviewLike reviewLike);

	public int reviewLikeCnt(HospitalReview hospReview);

	public int reviewLikeCntJson(int hospReviewNo);

	public List<HashMap<String, Object>> hosplikeList(int usernoParam);







}
