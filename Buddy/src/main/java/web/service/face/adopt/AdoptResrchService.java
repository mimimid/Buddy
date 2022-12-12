package web.service.face.adopt;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.AdoptResearch;
import web.dto.AdoptResrchFile;
import web.util.Paging;

public interface AdoptResrchService {
	
	/**
	 * 입양신청서 내용을 저장한다
	 * 
	 * @param adoptResearch - 신청서 내용 객체
	 * @param fileList - 이미지 리스트 객체
	 */
	public void adoptAnswer(AdoptResearch adoptResearch, List<MultipartFile> fileList);

	/**
	 * 입양신청서 페이징 생성
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return Paging - 페이징 계산된 객체
	 */
	public Paging getResrchPaging(int curPage);

	/**
	 * 페이징이 적용된 입양신청서 목록
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 입양신청서 목록
	 */
	public List<AdoptResearch> Resrchlist(Paging paging);

	/**
	 * 입양신청서 상세보기
	 * 
	 * @param viewResearch - 상세 조회할 입양신청서 번호
	 * @return 상세 입양신청서
	 */
	public AdoptResearch resrchView(AdoptResearch viewResearch);

	/**
	 * 입양번호를 이용해 업로드된 이미지를 조회한다
	 * 
	 * @param viewResearch - 조회할 입양 번호
	 * @return 첨부이미지 정보
	 */
	public List<AdoptResrchFile> getResrchFile(AdoptResearch viewResearch);

	/**
	 * 신청자 입양신청상태를 체크한다
	 * 
	 * @param checking - checking - 입양대기, 입양완료, 입양보류
	 */
	public void updateResrchView(Map<String, Object> map);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param adoptResrchFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public AdoptResrchFile getResrchFileDown(AdoptResrchFile adoptResrchFile);

}
