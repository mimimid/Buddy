package web.controller.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.AniUser;
import web.service.face.mypage.MypageService;

@Controller
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageService mypageService;
	
	@RequestMapping("/mypage/main")
	public void mypage() {}
	
	//주문조회
	@GetMapping("/mypage/order")
	public void orderInfo() {}
	
	//찜한 아이
	@GetMapping("/mypage/like_buddy")
	public void likeBuddyInfo() {
		
		
	}
	
	//문의접수
	@GetMapping("/mypage/qna")
	public void qnaInfo() {
		
		
	}
	
	//정보수정
	@PostMapping("/mypage/userUpdate")
	public String userInfoUpdateProc(AniUser user, HttpSession session) {
		int userno = (int) session.getAttribute("userno");
		user.setUserno(userno);
		logger.info("{}", user);
		
		//회원정보수정
		mypageService.updateUser(user);
		
		session.invalidate();
		
		return "redirect:/user/login";
		
	}
	
	//회원탈퇴
	@PostMapping("/mypage/userDelete")
	public String userInfoDelete(HttpSession session) {
		
		int userno = (int) session.getAttribute("userno");
		logger.info("{}", userno);
		
		//탈퇴진행
		mypageService.deleteUser(userno);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}
