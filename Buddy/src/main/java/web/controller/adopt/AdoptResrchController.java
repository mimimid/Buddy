package web.controller.adopt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;

import web.dto.AdoptResearch;
import web.dto.AdoptResrchFile;
import web.service.face.adopt.AdoptResrchService;
import web.util.Paging;

@Controller
@RequestMapping("/adopt")
public class AdoptResrchController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdoptResrchService adoptResrchService;
	
	@GetMapping("/research")
	public void research() {
	}
	
	@PostMapping("/research")
	public void researchAnswer(AdoptResearch adoptResearch, List<MultipartFile> fileList, HttpSession session) {
		logger.debug("{}", adoptResearch);
		logger.debug("핸드폰{}",adoptResearch.getAnswer2());
		for(MultipartFile f : fileList) logger.debug("파일리스트{}", f);
		
		adoptResrchService.adoptAnswer(adoptResearch, fileList);
	}
	
	@RequestMapping("/resrchList")
	public void resrchList(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		Paging paging = adoptResrchService.getResrchPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<AdoptResearch> list = adoptResrchService.Resrchlist(paging);
		for( AdoptResearch a : list )	logger.debug("{}", a);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/resrchView")
	public String resrchView(AdoptResearch viewResearch, Model model) {
		logger.debug("{}", viewResearch);
		
		//잘못된 게시글 번호 처리
		if( viewResearch.getAdoptNo() < 0 ) {
			return "redirect:/adopt/resrchList";
		}
		
		//게시글 조회
		viewResearch = adoptResrchService.resrchView(viewResearch);
		logger.debug("조회된 게시글 {}", viewResearch);
		
		//모델값 전달
		model.addAttribute("viewResearch", viewResearch);
		
		
		//첨부파일 모델값 전달
		List<AdoptResrchFile> resrchFile = adoptResrchService.getResrchFile(viewResearch);
		model.addAttribute("resrchFile", resrchFile);
		
		return "adopt/resrchView";
		
	}
	
	@RequestMapping("/resrchUpdate")
	public String updateResrch(int adoptNo, String checking) {
		logger.debug("{}", adoptNo);
		logger.debug("{}", checking);
		
		Map<String, Object> map = new HashMap<>();
		map.put("checking", checking);
		map.put("adoptNo", adoptNo);
		
		logger.debug("map: {}", map);
		logger.debug("map2: {}", map.get("adoptNo"));
		
		adoptResrchService.updateResrchView(map);
		
		return "redirect:/adopt/resrchView?adoptNo=" + map.get("adoptNo");
	}
	
	@RequestMapping("/resrchDown")
	public String download(AdoptResrchFile adoptResrchFile, Model model) {
		
		//첨부파일 정보 객체
		AdoptResrchFile resrchFile = adoptResrchService.getResrchFileDown(adoptResrchFile);
		logger.debug("{}", resrchFile);
		
		//모델값 전달
		model.addAttribute("downFile", resrchFile);
		
		return "resrchDown";
	}
}
