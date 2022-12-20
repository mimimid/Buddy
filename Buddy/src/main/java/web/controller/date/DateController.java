package web.controller.date;

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

import web.dto.DateBoard;
import web.dto.DateReport;
import web.service.face.date.DateService;
import web.service.face.date.LikeService;
import web.util.Paging;

@Controller
public class DateController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DateService dateService;
	@Autowired LikeService likeService;
	
	//데이트게시판 메인
	@RequestMapping("/date/main")
	public void dateMain(Model model) {
		
		List<DateBoard> list = dateService.list();
		for( DateBoard d : list ) logger.debug("{}", d);
		model.addAttribute("list", list);
		
		List<DateBoard> hitList = dateService.hitList();
		model.addAttribute("hitList", hitList);
		
	}

	//카테고리별 리스트목록
	@RequestMapping("/date/list")
	public void cafeList(
			@RequestParam(defaultValue = "0") int curPage
			, Model model, int category, 
			@RequestParam(required = false, value="sort") String sort,
			@RequestParam(required = false, value="keywoard")String keywoard) {
		
		//페이징 처리
		Paging paging = dateService.getPaging(curPage, category, keywoard);
		logger.debug("{}", paging);
		
		//게시물 목록
		List<DateBoard> list = dateService.list(paging, category, sort, keywoard);
		for( DateBoard d : list ) logger.debug("{}", d);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		
	}
	
	//검색페이지
	@RequestMapping("/date/listSearch")
	public void cafeListSearch(
			@RequestParam(defaultValue = "0") int curPage
			, Model model,
			@RequestParam(defaultValue = "0") int category, 
			@RequestParam(required = false, value="sort") String sort,
			@RequestParam(required = false, value="keywoard")String keywoard) {
		
		//페이징 처리
		Paging paging = dateService.getPaging(curPage, category, keywoard);
		logger.debug("{}", paging);
		
		//게시물 목록
		List<DateBoard> list = dateService.list(paging, category, sort, keywoard);
		for( DateBoard d : list ) logger.debug("{}", d);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("keywoard", keywoard);
		
	}
	
	//게시글 상세보기
	@RequestMapping("/date/view")
	public void dateView(
			DateBoard viewDate
			, Model model
			, HttpSession session
			) {
		
		//게시글 조회
		viewDate = dateService.view(viewDate);
		
		//댓글수 업데이트
		dateService.updateCommCount(viewDate);

		//좋아요수 업데이트
		dateService.updateLikeCount(viewDate);
		
		int like = 0;
		
		//좋아요 체크
		if( session.getAttribute("login") != null ) {
			
			int userno = (int) session.getAttribute("userno");
			
			like = likeService.ckLike(viewDate, userno);
			
		}
		
		model.addAttribute("like", like);
		model.addAttribute("viewDate", viewDate);
		
	}
	
	//신고처리
	@PostMapping("/date/report")
	public String dateReport(HttpSession session, DateReport report) {
		
		//유저아이디
		int userno = (int) session.getAttribute("userno");
		report.setUserno(userno);
		
		logger.info("{}", report);
		
		//신고접수처리
		dateService.report(report);
		
		int dateNo = report.getDateNo();
		
		return "redirect:/date/view?dateNo="+dateNo;
		
	}
	
}
