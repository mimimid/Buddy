package web.controller.date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import web.dto.DateBoard;
import web.dto.DateLike;
import web.service.face.date.LikeService;

@Controller
public class LikeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LikeService likeService;
	
	//좋아요 증가
	@PostMapping("/date/like")
	public void like(
			DateLike like
			, Model model
			, HttpSession session
			) {
		
		like.setUserno((int) session.getAttribute("userno"));
		logger.info("{}", like);
		
		likeService.insertLike(like);
		
		//좋아요 수 불러오기
		DateBoard likeCnt = likeService.likeCnt(like);
		model.addAttribute("likeCnt", likeCnt);
		
	}
	
	//좋아요 취소
	@PostMapping("/date/hate")
	public String hate (
			DateLike like
			, Model model
			, HttpSession session
			) {
		
		like.setUserno((int) session.getAttribute("userno"));
		logger.info("{}", like);
		
		int dateNo = like.getDateNo();
		System.out.println(dateNo);
		
		likeService.hate(like);
		
		DateBoard likeCnt = likeService.likeCnt(like);
		model.addAttribute("likeCnt", likeCnt);
		
		return "/date/like";
	}

}
