package web.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Nfile;
import web.dto.Notice;
import web.service.face.notice.NfileService;
import web.service.face.notice.NlikeService;
import web.service.face.notice.NoticeService;
import web.util.Paging;


@Controller
@RequestMapping("notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired private NlikeService nlikeService;
	@Autowired private NoticeService noticeService;
	@Autowired private NfileService nfileService;
	
//------------------------------------글쓰기----------------------------------------------------------------------	
	@RequestMapping(value = "/admin/write", method = RequestMethod.GET)
	public String write(Model model, HttpSession session) {
		logger.info("/notice/write [GET]");
		
		String usesrId = (String) session.getAttribute("userid");		//체크요망
		model.addAttribute("writer", usesrId);
		
		return "notice/write";
	}
	
	@RequestMapping(value = "/admin/write", method = RequestMethod.POST)
	public String writeOk(Notice notice, Nfile file, HttpServletRequest request) {
		logger.info("/notice/writeOk [GET]");
		logger.info("notice : {}", notice);
		logger.info("multipartRequest : {}", file.getItemImgList());
		
		int noticeno = noticeService.getNextNoticeno();
		notice.setNoticeNo(noticeno);
		noticeService.write(notice);
		
		for(MultipartFile nfile :file.getItemImgList() ) {
			nfileService.write(noticeno, nfile);
		}
		
		return "redirect:/notice/listPage";
	}
//------------------------------------------글 상세페이지------------------------------------------------------------	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int noticeno, HttpSession session, Model model) {
		logger.info("/notice/detail [GET]");
		logger.info("noticeno : {}", noticeno);

		//hit +1 올리기
		noticeService.view(noticeno);
		
		//--좋아요 했는지 안했는지 검사--
//		String userid = (String) session.getAttribute("userid");
//		logger.info("userId"+userid);
		String userid = "heejoo";
		model.addAttribute("IsLike", nlikeService.findLike(noticeno, userid));
		logger.info("userId true? false? {} : ",nlikeService.findLike(noticeno, userid));
		//-----------------------------------------------------------------------------좋아요 검사 끝		
		//로그인 안 한 상태면 관리자에게 쪽지보내기 버튼 없게 하기  -  null포인트 익셉션 일어나니까---- OK
		//로그인 안 한 상태면 회원에게 쪽지 보내기 버튼 없게 하기 - 아직 회원에게 쪽지 보내기 버튼 구현 안함
		//로그인 안 한 상태면 좋아요 못하게 하기 .
		
		
		//boardno로 Board객체 찾아서 모델에 넣어주기      
		logger.info("list : {}", noticeService.findByNo(noticeno));    //리스트로 불러옴    //좋아요도 조인 해야함
		model.addAttribute("notice", noticeService.findByNo(noticeno));
		
		session.setAttribute("id", "heejoo");  //지울것
		session.setAttribute("login", "true");  //지울것
		return "/notice/detail";	
	}
	
//------------------------------------글목록----------------------------------------------------------------------
		@RequestMapping("/listPage")
		public String  listPage(@RequestParam(defaultValue = "0") int curPage, Model model) {
	
			model.addAttribute("curPage", curPage);
			logger.info("curPage : {}", curPage);
			return "/notice/list";
	}
	
	
		@RequestMapping("/list")
		public String list(
				@RequestParam(defaultValue = "0") int curPage
				, Model model ) {
			
			Paging paging = noticeService.getPaging(curPage);
			logger.debug("{}", paging);
			model.addAttribute("paging", paging);
			
			List<Map<String, Object>> list = noticeService.list(paging);
			model.addAttribute("list", list);
			
			return "/notice/noticeList";
		}	

//----------------------------------------글 좋아요---------------------------------------------------
		@RequestMapping(value = "/like", method = RequestMethod.GET)
		public @ResponseBody Notice like(@RequestParam HashMap<String, Object> param) {
			logger.info("/notice/like [GET]");
			//logger.info("noticeno : {}", param.noticeno);
			
			//좋아요 테이블에서 +1기록 남기기
			nlikeService.likeNotice(param);
			Notice notice = new Notice();
			
			return notice;
		}
		
		@RequestMapping(value = "/dislike", method = RequestMethod.GET)
		public @ResponseBody Notice dislike(@RequestParam HashMap<String, Object> param) {
			logger.info("/notice/dislike [GET]");
			
			nlikeService.deleteLike(param);
			Notice notice = new Notice();
			
			return notice;
		}

//---------------------------------------------검색--------------------------------------------
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String search(String keyword, @RequestParam(defaultValue = "0") int curPage
				, Model model ) {
			logger.info("/notice/search [GET]");
			logger.info("keyword : {} ", keyword);
			
			Paging paging = noticeService.getPagingSearch(curPage, keyword);
			model.addAttribute("paging", paging);
			
			List<Map<String, Object>> list = noticeService.search(paging, keyword);
			model.addAttribute("list", list);
			
			return "/notice/noticeList";
		}
		

}
