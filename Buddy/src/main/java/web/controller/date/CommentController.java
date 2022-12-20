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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.dto.DateBoard;
import web.dto.DateComment;
import web.service.face.date.DCommentService;
import web.util.Paging;

@Controller
public class CommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DCommentService dCommentService;
	
	//댓글목록창
	@GetMapping("/date/commList")
	public ModelAndView commList(
			@RequestParam(defaultValue = "0") int curPage
			,DateBoard dateNo
			, Model model) {
		
		//페이징 처리
		Paging paging = dCommentService.getCommPaging(curPage, dateNo);
		
		//댓글 목록
		List<DateComment> commList = dCommentService.getCommList(paging, dateNo);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commList", commList);
		mav.addObject("dateNo", dateNo);
		
		return mav;
		
	}
	
	//댓글작성
	@PostMapping("/date/commList")
	public ModelAndView commWrite(
			int dateNo
			, Model model
			, HttpSession session
			, DateComment comm) {
		
		ModelAndView mav = new ModelAndView();

		//작성자 아이디
//		System.out.println(session.getAttribute("id"));
		String id = (String) session.getAttribute("id");
		int userno = dCommentService.getuserNo(id);
		
		//댓글 삽입
		comm.setUserno(userno);
		dCommentService.commWrite(comm);
		
		mav.setViewName("redirect:/date/view?dateNo=" + dateNo);
		
		return mav;
		
	}
	
	//댓글수정
	@PostMapping("/date/commUpdate")
	public ModelAndView commUpdateProc(
			DateComment comm
			, Model model
			) {
		ModelAndView mav = new ModelAndView();
		
		//댓글 수정
		System.out.println(comm);
		dCommentService.updateComm(comm);
		
		mav.setViewName("redirect:/date/view?dateNo=" + comm.getDateNo());
		
		return mav;
	}
	
	//댓글삭제
	@GetMapping("/date/commDelete")
	public String commDelete(
			DateComment cmNo
			, int dateNo) {
		
		//댓글 삭제
		dCommentService.deleteComm(cmNo);
		
		return "redirect:/date/view?dateNo=" + dateNo;
	}

}
