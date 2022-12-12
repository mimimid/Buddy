package web.service.impl.hospital;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.hospital.HospitalDao;
import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.dto.HospitalReviewLike;
import web.dto.Hospital;
import web.service.face.hospital.HospitalService;


@Service
public class HospitalServiceImpl implements HospitalService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HospitalDao hospitalDao;
	
	//서블릿 컨텍스트 객체	
	@Autowired ServletContext context;
	
	
	@Override
	public HospitalPaging getPaging(String hour24, String searchType, String keyWord, int curPage) {
		
		HospitalPaging  paramPaging = new HospitalPaging();
		paramPaging.setHour24(hour24);
		paramPaging.setSearchType(searchType);
		paramPaging.setKeyWord(keyWord);
		
		//총 게시글 수 조회하기
		int totalCount = hospitalDao.selectCntAll(paramPaging);
		
		//페이징 계산
		HospitalPaging hospitalPaging = new HospitalPaging(totalCount,curPage);
		
		
		return hospitalPaging;
	}
	
	
	@Override
	public List<Hospital> list(HospitalPaging hospitalPaging) {

		//병원 목록 조회
		List<Hospital> hospitalList = hospitalDao.selectAll(hospitalPaging);
		
		return hospitalList;
	}
	
	
	@Override
	public List<HashMap<String, Object>> hosplikeList(int usernoParam) {
		
		List<HashMap<String, Object>> hospLikeList = hospitalDao.selectHospLikeAll(usernoParam);
		logger.debug("hospLikeList {}",hospLikeList );
		
		return hospLikeList;
	}
	
	
	
	
	@Override
	public Hospital view(Hospital viewHospital) {
		
		//상세보기 조회 결과 리턴
		return hospitalDao.selectHospital(viewHospital);
	}
	

	@Override
	public int findLike(Hospital viewHospital, int userno) {

		HospitalLike like = new HospitalLike();
		
		like.setHospNo(viewHospital.getHospNo());
		like.setUserno(userno);
		
		if( hospitalDao.findLike(like) > 0) {
			return 1;
		}
		
		return 0;
	}
	
	
	@Override
	public void likeUp(HospitalLike like) {
		
		int res = 0;
		
		res = hospitalDao.likeUp(like);
		
		if(res == 1) {
			Hospital hospital = new Hospital();
			hospital .setHospNo(like.getHospNo());

			hospitalDao.likeCntUp(hospital);
		}
		
	}



	@Override
	public void likeDown(HospitalLike like) {
		
		int res = 0;
		
		res = hospitalDao.likeDown(like);
		
		if(res == 1) {
			Hospital hospital = new Hospital();
			hospital .setHospNo(like.getHospNo());

			hospitalDao.likeCntDown(hospital);
		}
		
	}
	
	
	@Override
	public void insertHospApiData(Hospital hospital) {
	
		if( ("01").equals( hospital.getHospStateCode() )  ) {
			hospitalDao.insertApiData(hospital);
		}else {
			return;
		}
	}

	
	@Override
	public List<HospitalReview> reviewList(int hospNo, String sort) {
		
		if(("1").equals(sort)) {
			return hospitalDao.selectAllReviewLikeSort(hospNo);
		}
		return hospitalDao.selectAllReview(hospNo);
	}


	@Override
	public void reviewWrite(HospitalReview hospReview) {
	
		int res = 0;
		res = hospitalDao.insertReview(hospReview);
		
		if(res == 1) {
			Hospital hospital = new Hospital();
			hospital.setHospNo(hospReview.getHospNo());
			
			hospitalDao.reviewCntUp(hospital);
			hospitalDao.reviewRateUpdate(hospital);
			
		}

	}


	@Override
	public void reviewDelete(HospitalReview hospReview) {
		int res = 0;
		res = hospitalDao.deleteReview(hospReview);
		
		if(res == 1) {
			Hospital hospital = new Hospital();
			hospital.setHospNo(hospReview.getHospNo());
			
			hospitalDao.reviewCntDown(hospital);
			hospitalDao.reviewRateUpdate(hospital);
			
		}
		
	}
	
	
	@Override
	public List<HospitalReviewLike> reviewLikeList(int hospNo) {
		
		return hospitalDao.selectAllReviewLike(hospNo);
	}
	
	
	@Override
	public void reviewLikeUp(HospitalReviewLike reviewLike) {
		
		int res = hospitalDao.reviewLikeUp(reviewLike);
		
		if(res == 1) {
			HospitalReview hospReview = new HospitalReview();
			hospReview.setHospReviewNo(reviewLike.getHospReviewNo());
			
			hospitalDao.reviewLikeCntUp(hospReview);
		}
		
	}
	
	
	@Override
	public void reviewLikeDown(HospitalReviewLike reviewLike) {
		
		int res = hospitalDao.reviewLikeDown(reviewLike);
		
		if(res == 1) {
			HospitalReview hospReview = new HospitalReview();
			hospReview.setHospReviewNo(reviewLike.getHospReviewNo());
			
			hospitalDao.reviewLikeCntDown(hospReview);
		}
		
	}
	
	
	@Override
	public int reviewLikeCnt(HospitalReview hospReview) {
		
		return hospitalDao.getReviewLikeCnt(hospReview);
	}
	
	
	
	
	
	
	
	
// 글쓰기
	@Override
	public void write(Hospital hospital, MultipartFile file) {
		
		//게시글 처리
		hospitalDao.insertHospital(hospital);
		
		//---------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
				if( file.getSize() <= 0 ) {
					return;
				}
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID 추가
		
		//실제 저장 될 파일의 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		//----------------------------------------------
		//첨부사진 정보 DB 기록
		
		HospitalPic pic = new HospitalPic();
		
		pic.setHospNo(hospital.getHospNo());
		pic.setHpicOriginName(originName);
		pic.setHpicStoredName(storedName);
		
		hospitalDao.insertPic(pic);
	}
	
	
	@Override
	public HospitalPic getAttachPic(Hospital viewHospital) {
		return hospitalDao.selectHospPicByHospNo(viewHospital);
	}
	
	
	@Override
	public void update(Hospital hospital, MultipartFile file) {
		
		//게시글 처리
		hospitalDao.updateHospital(hospital);
		
		//---------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID 추가
		
		//실제 저장 될 파일의 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		//----------------------------------------------
		//첨부사진 정보 DB 기록
		
		HospitalPic pic = new HospitalPic();
		
		pic.setHospNo(hospital.getHospNo());
		pic.setHpicOriginName(originName);
		pic.setHpicStoredName(storedName);
		
		
		//기존에 병원글에 연결된 첨부사진을 삭제한다
		hospitalDao.deleteHospPic(hospital);
		
		hospitalDao.insertPic(pic);
		
	}
	
	
	@Override
	public void delete(Hospital hospital) {
		
		hospitalDao.deleteHospLike(hospital);
		hospitalDao.deleteHospReviewLike(hospital);
		hospitalDao.deleteHospReview(hospital);
		hospitalDao.deleteHospPic(hospital);
		hospitalDao.deleteHospital(hospital);
		
		
	}


	@Override
	public int reviewLikeCntJson(int hospReviewNo) {

		return hospitalDao.selectReviewLikeCnt(hospReviewNo);
	}
	
	
	

}
