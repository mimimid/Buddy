package web.controller.date;

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

	@RequestMapping("/date/cafe/list")
	public void cafeList(
			@RequestParam(defaultValue = "0") int curPage
			, Model model) {
//		Paging paging = dateService.getPaging(curPage);
//		logger.debug("{}", paging);
//		model.addAttribute("paging", paging);
		
//		List<DateBoard> list = dateService.list(paging);
//		for( DateBoard d : list ) logger.debug("{}", d);
//		model.addAttribute("list", list);		
	}
	
}
