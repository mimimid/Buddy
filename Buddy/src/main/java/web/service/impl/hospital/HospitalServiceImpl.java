package web.service.impl.hospital;

import java.io.File;
import java.io.IOException;
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
		
		int totalCount = hospitalDao.selectCntAll(paramPaging);
		
		HospitalPaging hospitalPaging = new HospitalPaging(totalCount,curPage);	
		
		return hospitalPaging;
	}
	
	
	@Override
	public List<Hospital> list(HospitalPaging hospitalPaging) {
		List<Hospital> hospitalList = hospitalDao.selectAll(hospitalPaging);	
		return hospitalList;
	}
	

	@Override
	public Hospital view(Hospital viewHospital) {

		return hospitalDao.selectHospital(viewHospital);
	}
	
	
	
	@Override
	public void likeUp(HospitalLike like) {		
		 hospitalDao.likeUp(like);	
	}



	@Override
	public void likeDown(HospitalLike like) {		
		hospitalDao.likeDown(like);		
	}
	
	
	@Override
	public List<HospitalReview> reviewList(int hospNo) {	
		return hospitalDao.selectAllReview(hospNo);
	}


	@Override
	public void reviewWrite(HospitalReview hospReview) {	
		hospitalDao.insertReview(hospReview);
	}


	@Override
	public void reviewDelete(HospitalReview hospReview) {		
		hospitalDao.deleteReview(hospReview);
	}

	
	
	@Override
	public void reviewLikeUp(HospitalReviewLike reviewLike) {		
		hospitalDao.reviewLikeUp(reviewLike);		
	}
	
	
	@Override
	public void reviewLikeDown(HospitalReviewLike reviewLike) {
		 hospitalDao.reviewLikeDown(reviewLike);	
	}
	

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
		hospitalDao.deleteHospReview(hospital);
		hospitalDao.deleteHospPic(hospital);
		hospitalDao.deleteHospital(hospital);
		
		
	}


	
	
	

}
