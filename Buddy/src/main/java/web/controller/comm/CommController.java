package web.controller.comm;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.CommBoard;
import web.service.face.comm.CommService;
import web.util.Paging;

@Controller
@RequestMapping("/comm")
public class CommController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommService commService;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model
			) {
		Paging paging = commService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<CommBoard> list = commService.list(paging);
		for( CommBoard c : list )	logger.debug("{}", c);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/view")
	public String view(CommBoard viewBoard, Model model) {
		logger.debug("{}", viewBoard);
		
		// 잘못된 게시글 번호 처리
		if( viewBoard.getCommNo() < 0 ) {
			return "redirect:/comm/list";
		}
		
		// 게시글 조회
		viewBoard = commService.view(viewBoard);
		logger.debug("조회된 게시글 {}", viewBoard);
		
		// 모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		return "comm/view";
		
		
	}
	
}
