package web.controller.hospital;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Hospital;
import web.dto.HospitalLike;
import web.dto.HospitalPaging;
import web.dto.HospitalPic;
import web.dto.HospitalReview;
import web.service.face.hospital.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HospitalService hospitalService;
	
	
	
	@GetMapping("/hosplist")
	public String hosplist(
			@RequestParam(required = false) String hour24,
			@RequestParam(required = false) String searchType, 
			@RequestParam(required = false) String keyWord,
			@RequestParam(defaultValue = "0") int curPage,
			Model model,
			HttpSession session) {
		
		HospitalPaging hospPaging = hospitalService.getPaging(hour24,searchType, keyWord,curPage );
		hospPaging.setHour24(hour24);
		hospPaging.setSearchType(searchType);
		hospPaging.setKeyWord(keyWord);
		
		logger.debug("hospPaging : {}", hospPaging);
		
		List<Hospital> hospList = hospitalService.list(hospPaging);
		logger.debug("hospList {}", hospList);
		
		
		model.addAttribute("hospList", hospList);
		model.addAttribute("paging", hospPaging);
		
		
		//임시 세션
		session.setAttribute("userid", "testID03");
		session.setAttribute("userno", 3);
		session.setAttribute("usernick", "닉네임3");
		session.setAttribute("login", true);
		
		
		return "hospital/hosplist";
	}
	
	
	@GetMapping("/hospview")
	public String hospView(Hospital viewHospital, Model model, HttpSession session) {
		
		logger.debug("병원번호 : {}", viewHospital);
		
		//병원 상세 게시글 조회
		viewHospital  = hospitalService.view(viewHospital);
		
		//첨부사진 조회
		HospitalPic hospPic = hospitalService.getAttachPic(viewHospital);
		
		
		model.addAttribute("viewHospital", viewHospital);
		model.addAttribute("hospPic", hospPic);
		
		return "hospital/hospview";
	}
	
	
	@PostMapping("/hospview/likeup")
	public @ResponseBody void likeUp(HospitalLike like, HttpSession session) {
		
		like.setUserno((int) session.getAttribute("userno"));

		hospitalService.likeUp(like);
		
	}
	
	@PostMapping("/hospview/likedown")
	public @ResponseBody void likeDown(HospitalLike like, HttpSession session) {
		
		like.setUserno((int) session.getAttribute("userno"));		
		logger.debug("좋아요 정보 {}", like);
		
		hospitalService.likeDown(like);		
	}
	

	//병원 글쓰기
	@GetMapping("/hospwrite")
	public void write(HttpSession session) {}
	
	
	@PostMapping("/hospwrite")
	public String writeProc(Hospital hospital, MultipartFile file, HttpSession session) {
		logger.debug("작성글 : {}",hospital);
		logger.debug("파일 : {}",file);
		
		
		//작성자 정보 추가
		hospital.setAdminno((int) session.getAttribute("userno"));
		hospital.setAdminid((String) session.getAttribute("userid"));
		logger.debug("{}", hospital);
		
		//게시글 작성, 첨부파일 처리
		hospitalService.write(hospital, file);
		
		
		return "redirect:/hospital/hosplist";
	}
	
	
	//병원 글수정
	@GetMapping("/hospupdate")
	public String hospUpdate(Hospital hospital, Model model) {
		logger.debug("글번호 : {}", hospital);
		
		hospital = hospitalService.view(hospital);
		
		HospitalPic hospPic = hospitalService.getAttachPic(hospital);
		
		//모델값 전달
		model.addAttribute("updateHosp", hospital);
		model.addAttribute("hospPic", hospPic);
		
		return "hospital/hospupdate";
	}
	
	
	@PostMapping("/hospupdate")
	public String hospUpdateProc(Hospital hospital, MultipartFile file) {
		logger.debug("{}", hospital);
		
		hospitalService.update(hospital, file);
		
		return "redirect:/hospital/hospview?hospNo="+hospital.getHospNo();
	}
	
	// 병원 글삭제
	@RequestMapping("/hospdelete")
	public String hospDelete (Hospital hospital) {
		
		hospitalService.delete(hospital);
		
		return "redirect:/hospital/hosplist";
	}
	
	
	@GetMapping("/reviews")
	public String hospReviewList(
			int hospNo, HttpSession session, Model model
			) {
	
		List<HospitalReview> reviewList = hospitalService.reviewList(hospNo);
		
		model.addAttribute("reviewList", reviewList);
		
		return "hospital/reviews";
	}
	
	
	@PostMapping("/reviewwrite")
	public String reviewWrite(HospitalReview hospReview, HttpSession session) {
		
		hospReview.setUserid((String)session.getAttribute("userid"));
		hospReview.setUserno((int) session.getAttribute("userno"));
		hospReview.setUsernick((String)session.getAttribute("usernick"));
		
		hospitalService.reviewWrite(hospReview);
		
		return "redirect:/hospital/reviews?hospNo="+hospReview.getHospNo();	
	}
	
	
	@GetMapping("/reviewdelete")
	public String reviewDelete(HospitalReview hospReview, Model model) {

		hospitalService.reviewDelete(hospReview);	
		List<HospitalReview> reviewList = hospitalService.reviewList(hospReview.getHospNo());	
		model.addAttribute("reviewList", reviewList);
		
		return "redirect:/hospital/reviews?hospNo="+hospReview.getHospNo();
	}
	
	
	
//	@PostMapping("/review/likeup")
//	public @ResponseBody void reviewLikeUp( HospitalReviewLike reviewLike, HttpSession session) {
//		
//		reviewLike.setUserno((int) session.getAttribute("userno"));
//	
//		
//	}
//	
//	
//	@PostMapping("/review/likedown")
//	public @ResponseBody void reviewLikeDown( HospitalReviewLike reviewLike, HttpSession session) {
//		
//		reviewLike.setUserno((int) session.getAttribute("userno"));
//		
//		hospitalService.reviewLikeDown(reviewLike);
//		
//	}
	

	
	
	@GetMapping("/hospApi")
	public void hospApi() throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		urlBuilder.append("/" + URLEncoder.encode("sample","UTF-8") ); /*인증키(sample사용시에는 호출시 제한됩니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("xml","UTF-8") ); /*요청파일타입 */
		urlBuilder.append("/" + URLEncoder.encode("CardSubwayStatsNew","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치(sample인증키 사용시 5이내 숫자)*/
		urlBuilder.append("/" + URLEncoder.encode("5","UTF-8")); 
		/*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
		urlBuilder.append("/" + URLEncoder.encode("20220301","UTF-8")); /* 서비스별추가 요청인자들*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		System.out.println("Response code: " + conn.getResponseCode()); /* 연결자체에 대한 확인이 필요하므로 추가합니다.*/
		BufferedReader rd;// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
			
	}
	
	
}
