package web.controller.date;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import web.dto.DateBoard;
import web.dto.DateComment;
import web.service.face.date.DCommentService;

@Controller
public class CommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DCommentService dCommentService;
	
	//댓글목록창
	@GetMapping("/date/commList")
	public ModelAndView commList(DateBoard dateNo, Model model) {
		
		List<DateComment> commList = dCommentService.getList(dateNo);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commList", commList);
		
		return mav;
		
	}
	
	//댓글작성
	
	//댓글수정
	
	//댓글삭제

}
