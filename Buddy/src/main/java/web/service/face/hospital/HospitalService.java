package web.service.face.hospital;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Hospital;
import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;

public interface HospitalService {


	public HospitalPaging getPaging(String hour24, String searchType, String keyWord, int curPage);

	public List<Hospital> list(HospitalPaging hospitalPaging);
	
	public Hospital view(Hospital viewHospital);

	public void likeUp(HospitalLike like);
	
	public void likeDown(HospitalLike like);

	public List<HospitalReview> reviewList(int hospNo);

	public void reviewWrite(HospitalReview hospReview);
	public void reviewDelete(HospitalReview hospReview);
	public void write(Hospital hospital, MultipartFile file);
	
	public HospitalPic getAttachPic(Hospital viewHospital);

	public void update(Hospital hospital, MultipartFile file);
	public void delete(Hospital hospital);
	
	public void reviewLikeUp(HospitalReviewLike reviewLike);
	public void reviewLikeDown(HospitalReviewLike reviewLike);







}
