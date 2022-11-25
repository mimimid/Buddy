package web.controller.adopt;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Report;
import web.service.face.adopt.ReportService;
import web.util.Paging;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired  ReportService reportService;
	
	@RequestMapping(value = "/report/reptList", method = RequestMethod.GET)
	public void reptList(
			@RequestParam(defaultValue = "0") int curPage
			, Model model) {
		logger.debug("relist");
		
		Paging paging = reportService.reptGetPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Report> reptList = reportService.reptList(paging);
		for(Report r : reptList) logger.debug("{}", r);
		model.addAttribute("reptList", reptList);
		
	}

}
