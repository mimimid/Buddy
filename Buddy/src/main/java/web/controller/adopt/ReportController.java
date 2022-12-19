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
import org.springframework.web.servlet.ModelAndView;

import web.dto.Report;
import web.dto.ReptFile;
import web.service.face.adopt.ReportService;
import web.util.Paging;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReportService reportService;
	
	@RequestMapping("/reptList")
	public void reptList(Model model) {
		logger.debug("reptList");
		int total = reportService.reptGetTotal();
		model.addAttribute("total", total);
		logger.debug("total : {}",total);
	}
	
	@RequestMapping("/reptList_ajax")
	public ModelAndView reptList_ajax(
			@RequestParam(defaultValue = "0") int curPage
			, @RequestParam(value ="reptTitle",required = false) String reptTitle
			, Model model) {
		logger.debug("reptList_ajax");
		logger.debug("keyword : {}",reptTitle);
		logger.debug("keyword : {}",curPage);
		
		Paging paging = (Paging)reportService.getReptPaging(curPage, reptTitle);
		logger.debug("pageing : {}", paging);
		model.addAttribute("paging", paging);
		
		Map<String, Object> map = new HashMap<>();
		map.put("reptTitle", reptTitle);
		map.put("paging", paging);
		logger.debug("map : {}", map);
		logger.debug("map : {}", map.get(reptTitle));
			
		List<Map<String, Object>> list = reportService.reptPagingFileList(map);
		ModelAndView mav = new ModelAndView();  
		   mav.addObject("data", list);  
		   mav.setViewName("/report/reptList_ajax");  
		   return mav;  

	}

	@GetMapping("/reptWrite")
	public void reptWrite() {
		logger.debug("reptWrite");
	}
	
	@PostMapping("/reptWrite")
	public String writeProcess(Report report, MultipartFile file, HttpSession session) {
		logger.debug("{}", report);
		logger.debug("{}", file);

		report.setAdminid((String)session.getAttribute("userid"));
		logger.debug("{}",report);
		
		reportService.reptWrite(report, file);
		
		return "redirect:/report/reptList";
	}
	
	@RequestMapping("/reptView")
	public String reptView(Report report, Model model) {
		
		if( report.getReptNo() < 0 ) {
			return "redirect:/report/reptList";
		}
		
		Report reptView = reportService.ReptView(report);
		logger.debug("상세보기 {}", reptView);
		
		model.addAttribute("reptView", reptView);
		
		ReptFile reptFile = reportService.getReptViewFile(report);
		model.addAttribute("reptFile", reptFile);
		
		return "report/reptView";
	}
	
	@RequestMapping("/reptDown")
		public String reptDown(ReptFile reptFile, Model model) {
			
			reptFile = reportService.getFile(reptFile);
			logger.debug("{}", reptFile);
			
			model.addAttribute("downFile", reptFile);
			
			return "reptDown";
	}
	
	@GetMapping("/reptUpdate")
	public String reptUpdate(Report report, Model model) {
		logger.debug("{}", report);
		
		if( report.getReptNo() < 0 ) {
			return "redirect:/report/reptList";
		}
		
		report = reportService.ReptView(report);
		logger.debug("조회된 게시글 {}", report);
		
		model.addAttribute("reptView", report);
		
		
		//첨부파일 모델값 전달
		ReptFile reptFile = reportService.getReptViewFile(report);
		model.addAttribute("reptFile", reptFile);
		
		
		return "report/reptUpdate";

	}
	
	@PostMapping("/reptUpdate")
	public String reptUpdateProcess(Report report, MultipartFile file) {
		logger.debug("{}", report);
		
		reportService.reptUpdate(report, file);
		
		return "redirect:/report/reptView?reptNo=" + report.getReptNo();
	}
	
	@RequestMapping("/reptDelete")
	public String reptDelete(Report report) {
		
		reportService.reptDelete(report);
		
		return "redirect:/report/reptList";
	}


}
