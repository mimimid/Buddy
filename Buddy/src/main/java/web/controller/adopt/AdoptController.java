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

import web.dto.AdoptCmt;
import web.dto.AdoptFile;
import web.dto.AdoptPro;
import web.dto.AdoptWish;
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
	public String AdoptProview(AdoptPro adoptPro, int rnum, Model model) {
		logger.debug("{}", adoptPro);
		logger.debug("{}", rnum);
		
		//잘못된 게시글 번호 처리
		if( adoptPro.getAniNo() < 0 ) {
			return "redirect:/adopt/pro";
		}
		
		//게시글 조회
		 Map<String, Object> pro = adoptService.adoptView(adoptPro);
		logger.debug("조회된 게시글 {}", pro);
		
		//모델값 전달
		model.addAttribute("pro", pro);
		
		
		//첨부파일 모델값 전달
		List<AdoptFile> adoptFile = adoptService.getAdoptFile(adoptPro);
		model.addAttribute("adoptFile", adoptFile);
		
		//이전이후게시글 모델값 전달
		List<Map<String, Object>> num = adoptService.adoptRnumView(rnum);
		model.addAttribute("num", num);
		
		//댓글 수
		int cmtcnt = adoptService.getCmtCnt(adoptPro );
		model.addAttribute("cmtcnt", cmtcnt);
		
		//댓글 리스트 모델값 전달
		List<AdoptCmt> adoptCmt = adoptService.adoptCmtView(adoptPro);
		model.addAttribute("adoptCmt", adoptCmt);
		
		
		
		
		return "adopt/proView";
	}
	
	@GetMapping("/proUpdate")
	public String proUpdate(AdoptPro adoptPro, Model model) {
		logger.debug("{}", adoptPro);
		
		if( adoptPro.getAniNo() < 0 ) {
			return "redirect:/adopt/pro";
		}
		
		Map<String, Object> pro = adoptService.adoptView(adoptPro);
		logger.debug("조회된 게시글 {}", pro);
		
		model.addAttribute("pro", pro);
		
		
		//첨부파일 모델값 전달
		List<AdoptFile> adoptFile = adoptService.getAdoptFile(adoptPro);
		model.addAttribute("adoptFile", adoptFile);
		
		
		return "adopt/proUpdate";

	}
	
	@PostMapping("/proUpdate")
	public String proUpdateProcess(AdoptPro adoptPro, List<MultipartFile> fileList, int rnum) {
		logger.debug("{}", adoptPro);
		for(MultipartFile f : fileList) logger.debug("파일리스트{}", f);
		
		adoptService.proUpdate(adoptPro, fileList);
		
		return "redirect:/adopt/proView?aniNo=" + adoptPro.getAniNo() + "&rnum=" + rnum;
	}
	
	@RequestMapping("/proDelete")
	public String proDelete(AdoptPro adoptPro) {
		
		adoptService.adoptDelete(adoptPro);
		
		return "redirect:/adopt/pro";
	}
	
	@RequestMapping("/proViewWish")
	public String AdoptPro_ajax(AdoptPro adoptPro, HttpSession session,int rnum, Model model) {
		AdoptWish adoptWish = new AdoptWish();
		
		adoptWish.setUserno( (int)session.getAttribute("userno"));
		
		adoptWish.setAniNo(adoptPro.getAniNo());
		
		logger.debug("adoptWish : {}", adoptWish);
		
		int wish = adoptService.proWish(adoptWish);
		
		return "redirect:/adopt/proView?aniNo="+ adoptPro.getAniNo() + "&rnum=" + rnum;
	}
	
	@RequestMapping("/cmt")
	public String AdoptCmtWrite(AdoptCmt adoptCmt, HttpSession session, int rnum, Model model) {
		
		adoptCmt.setUserno((int)session.getAttribute("userno"));
		
		logger.debug("{}", adoptCmt);
		
		adoptService.cmtWrite(adoptCmt);
		
		return "redirect:/adopt/proView?aniNo="+ adoptCmt.getAniNo() + "&rnum="+ rnum;
		
	}

	
	@RequestMapping("cmtDelete")
	public String AdoptCmtDelete(AdoptCmt adoptCmt, int rnum) {
		
		adoptService.cmtDelete(adoptCmt);
		
		return "redirect:/adopt/proView?aniNo="+ adoptCmt.getAniNo() + "&rnum="+ rnum;
	}
	
	@RequestMapping("cmtUpdate")
	public String AdoptCmtUpdate(AdoptCmt adoptCmt, int rnum) {
		
		logger.debug("댓글수정{}", adoptCmt);
		adoptService.cmtUpdate(adoptCmt);
		
		return "redirect:/adopt/proView?aniNo="+ adoptCmt.getAniNo() + "&rnum="+ rnum;
	}
	
	@RequestMapping("cmtRe")
	public String AdoptcmtRe(AdoptCmt adoptCmt, int rnum,HttpSession session) {
		adoptCmt.setUserno((int)session.getAttribute("userno"));
		
		logger.debug("답글{}", adoptCmt);
		
		adoptService.cmtReWrite(adoptCmt);
		
		return "redirect:/adopt/proView?aniNo="+ adoptCmt.getAniNo() + "&rnum="+ rnum;
	}
	

}
