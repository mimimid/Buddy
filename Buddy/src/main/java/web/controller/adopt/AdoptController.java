package web.controller.adopt;

import java.util.ArrayList;
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

import web.dto.AdoptFile;
import web.dto.AdoptPro;
import web.dto.AdoptResearch;
import web.dto.AdoptResrchFile;
import web.dto.AdoptWish;
import web.dto.Report;
import web.dto.ReptFile;
import web.service.face.adopt.AdoptService;
import web.util.Paging;

@Controller
@RequestMapping("/adopt")
public class AdoptController {
		
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdoptService adoptService;
	
	@RequestMapping("/pro")
	public void AdoptPro(
			@RequestParam(defaultValue = "0") int curPage
			, String aniCate
			, Model model ) {
		
		Paging paging = adoptService.getProPaging(curPage, aniCate);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		Map<String, Object> map = new HashMap<>();
		map.put("aniCate", aniCate);
		map.put("paging", paging);
		
		logger.debug("map: {}", map);
		
		
		List<Map<String, Object>> list = adoptService.proList(map);
		for( Map<String, Object> a : list )	logger.debug("{}", a);
		model.addAttribute("list", list);
		model.addAttribute("aniCate", aniCate);
		
	}

	@RequestMapping("/proWish")
	public String proWish(AdoptPro adoptPro, HttpSession session, Model model) {
		
		AdoptWish adoptWish = new AdoptWish();
		
		adoptWish.setUserno( (int)session.getAttribute("userno"));
		
		adoptWish.setAniNo(adoptPro.getAniNo());
		
		logger.debug("adoptWish : {}", adoptWish);
		
		int wish = adoptService.proWish(adoptWish);
		
		return "redirect:/adopt/pro";
		
	}
	
	@RequestMapping("/proWishList")
	public void proWishList(HttpSession session, Model model) {
		
		//로그인
		if(session.getAttribute("userno") == null) {
			
		}
		
		int userno = (int)session.getAttribute("userno");
		
		List<AdoptWish> adoptWishList = adoptService.wishList(userno);
		
		List<Map<String, Object>> proWishList =new ArrayList<Map<String, Object>>();
		for(AdoptWish wish:adoptWishList)
		{
			Map<String, Object> list = adoptService.proWishDetail(wish.getAniNo());
			proWishList.add(list);
		}
		model.addAttribute("proWishList", proWishList);
		
		int wishCount=adoptService.wishCount(userno);
		
		model.addAttribute("wishCount", wishCount);
	}
	
	
	@GetMapping("/proWrite")
	public void proWrite() {}
	
	@PostMapping("/proWrite")
	public String writeProcess(AdoptPro adoptPro, List<MultipartFile> fileList, HttpSession session) {
		logger.debug("{}", adoptPro);
		for(MultipartFile f : fileList) logger.debug("파일리스트{}", f);
		
		adoptPro.setUserid( (String) session.getAttribute("userid") );
		logger.debug("{}", adoptPro);
		
		adoptService.writeProcess(adoptPro, fileList);
		
		return "redirect:/adopt/pro";
	}
		
	@RequestMapping("/adoptDown")
	public String download(AdoptFile adoptFile, Model model) {
		
		//첨부파일 정보 객체
		AdoptFile adoptFiles = adoptService.getAdoptFileDown(adoptFile);
		logger.debug("{}", adoptFiles);
		
		//모델값 전달
		model.addAttribute("downFile", adoptFiles);
		
		return "adoptDown";
	}
	
	@RequestMapping("/proView")
	public String AdoptProview(AdoptPro adoptPro, Model model) {
		logger.debug("{}", adoptPro);
		
		//잘못된 게시글 번호 처리
		if( adoptPro.getAniNo() < 0 ) {
			return "redirect:/adopt/pro";
		}
		
		//게시글 조회
		adoptPro = adoptService.adoptView(adoptPro);
		logger.debug("조회된 게시글 {}", adoptPro);
		
		//모델값 전달
		model.addAttribute("adoptPro", adoptPro);
		
		
		//첨부파일 모델값 전달
		List<AdoptFile> adoptFile = adoptService.getAdoptFile(adoptPro);
		model.addAttribute("adoptFile", adoptFile);
		
		return "adopt/proView";
	}
	
	@RequestMapping("/proUpdate")
	public String proUpdate(AdoptPro adoptPro, Model model) {
		logger.debug("{}", adoptPro);
		
		if( adoptPro.getAniNo() < 0 ) {
			return "redirect:/adopt/pro";
		}
		
		adoptPro = adoptService.adoptView(adoptPro);
		logger.debug("조회된 게시글 {}", adoptPro);
		
		model.addAttribute("adoptPro", adoptPro);
		
		
		//첨부파일 모델값 전달
		List<AdoptFile> adoptFile = adoptService.getAdoptFile(adoptPro);
		model.addAttribute("adoptFile", adoptFile);
		
		
		return "adopt/proUpdate";

	}
	
	@PostMapping("/proUpdate")
	public String proUpdateProcess(AdoptPro adoptPro, List<MultipartFile> fileList) {
		logger.debug("{}", adoptPro);
		for(MultipartFile f : fileList) logger.debug("파일리스트{}", f);
		
		adoptService.proUpdate(adoptPro, fileList);
		
		return "redirect:/adopt/proView?aniNo=" + adoptPro.getAniNo();
	}
	
	@RequestMapping("/proDelete")
	public String proDelete(AdoptPro adoptPro) {
		
		adoptService.adoptDelete(adoptPro);
		
		return "redirect:/adopt/pro";
	}
	
	@RequestMapping("/proViewWish")
	public String AdoptPro_ajax(AdoptPro adoptPro, HttpSession session, Model model) {
		AdoptWish adoptWish = new AdoptWish();
		
		adoptWish.setUserno( (int)session.getAttribute("userno"));
		
		adoptWish.setAniNo(adoptPro.getAniNo());
		
		logger.debug("adoptWish : {}", adoptWish);
		
		int wish = adoptService.proWish(adoptWish);
		
		return "redirect:/adopt/proView?aniNo="+ adoptPro.getAniNo();
	}
	
	

	

	
	
	
	
	

}
