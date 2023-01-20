package web.controller.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.CommBoard;
import web.service.face.comm.CommService;

@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommService commService;
	
	@RequestMapping("/")
	public String main(Model model) {
		
		// 최신글 목록 5개 조회
		List<CommBoard> rlist = commService.rlist();
		for( CommBoard r : rlist )	logger.debug("{}", r);
		model.addAttribute("rlist", rlist);
		
		// 인기글 목록 5개 조회
		List<CommBoard> plist = commService.plist();
		for( CommBoard p : plist )	logger.debug("{}", p);
		model.addAttribute("plist", plist);
		
		return "main";
	}
	
}
