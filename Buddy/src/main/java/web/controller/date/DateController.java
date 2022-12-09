package web.controller.date;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.DateBoard;
import web.service.face.date.DateService;
import web.util.Paging;

@Controller
public class DateController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DateService dateService;
	
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
	

	
}
