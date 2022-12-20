package web.controller.hospital;


import java.util.List;

import javax.servlet.http.HttpSession;

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
	
		hospital.setAdminno((int) session.getAttribute("userno"));
		hospital.setAdminid((String) session.getAttribute("userid"));
		logger.debug("{}", hospital);
		
		hospitalService.write(hospital, file);
			
		return "redirect:/hospital/hosplist";
	}
	

	@GetMapping("/hospupdate")
	public String hospUpdate(Hospital hospital, Model model) {

		hospital = hospitalService.view(hospital);
		
		HospitalPic hospPic = hospitalService.getAttachPic(hospital);
		
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
	

	
}
