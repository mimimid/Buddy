package web.controller.mypage;

import java.util.List;

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

import web.dto.AniUser;
import web.dto.QnaBoard;
import web.service.face.mypage.MypageService;
import web.util.Paging;

@Controller
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageService mypageService;
	
	@RequestMapping("/mypage/main")
	public void mypage() {}
	
	//주문조회
	@GetMapping("/mypage/order")
	public void orderInfo() {}
	
	//관심 병원
	@GetMapping("/mypage/like_hospital")
	public void likeHospitalInfo() {
		
		
	}
	
	//문의접수리스트
	@GetMapping("/mypage/qna")
	public void qnaInfo(
			HttpSession session
			, Model model
			, @RequestParam(defaultValue = "0") int curPage) {
		
		//유저번호
		int userno = (int) session.getAttribute("userno");
		
		//페이징 처리
		Paging paging = mypageService.getPaging(curPage, userno);
		
		//문의게시판리스트조회
		List<QnaBoard> list = mypageService.list(userno, paging);
		
		//문의게시글 개수
		int listCnt = mypageService.listCnt(userno);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("listCnt", listCnt);
		
	}
	
	//문의게시글 작성
	@GetMapping("/mypage/qnaWrite")
	public void qnaWrite() {}

	//문의게시글 작성
	@PostMapping("/mypage/qnaWrite")
	public String qnaWriteProc(QnaBoard board, HttpSession session) {
		logger.debug("{}", board);
		
		//유저번호
		int userno = (int) session.getAttribute("userno");
		board.setUserno(userno);
		
		//게시글 등록 처리
		mypageService.write(board);
		
		return "redirect:/mypage/qna";
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
