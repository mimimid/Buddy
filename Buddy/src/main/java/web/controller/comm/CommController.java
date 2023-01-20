package web.controller.comm;

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
import org.springframework.web.multipart.MultipartFile;

import web.dto.CommBoard;
import web.dto.CommCmt;
import web.dto.CommFile;
import web.dto.CommLike;
import web.dto.CommReport;
import web.service.face.comm.CommService;
import web.util.Paging;

@Controller
@RequestMapping("/comm")
public class CommController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommService commService;
	
	//----- 게시판 ---------------------------------------------------------
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model
			, @RequestParam(required = false) String animal
			, @RequestParam(required = false) String category
			, @RequestParam(required = false) String searchType
			, @RequestParam(required = false) String keyword
			) {
		Paging paging = commService.getPaging(curPage, animal, category, searchType, keyword);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<CommBoard> list = commService.list(paging, animal, category, searchType, keyword);
		for( CommBoard c : list )	logger.debug("{}", c);
		model.addAttribute("list", list);
		
		model.addAttribute("animal", animal);
		model.addAttribute("category", category);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
	}
	
	@RequestMapping("/view")
	public String view(CommBoard viewBoard, Model model, HttpSession session) {
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
		
		// 첨부파일 모델값 전달
		CommFile commFile = commService.getAttachFile(viewBoard);
		model.addAttribute("commFile", commFile);
		
		int like = 0;
		
		if( session.getAttribute("login") != null ) {
			
			// 좋아요 여부 조회
			int userno = (int) session.getAttribute("userno");
			
			like = commService.findLike(viewBoard, userno);
			logger.debug("{}", like);
				
		}
		
		model.addAttribute("like", like);
		
		return "comm/view";
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProcess(CommBoard commBoard, MultipartFile file, HttpSession session) {
		logger.debug("{}", commBoard);
		logger.debug("{}", file);
		
		// 작성자 정보 추가
		commBoard.setUserno( (int) session.getAttribute("userno") );
		commBoard.setCommWriterNick( (String) session.getAttribute("nick") );
		logger.debug("{}", commBoard);
		
		// 게시글, 첨부파일 처리
		commService.write(commBoard, file);
		
		return "redirect:/comm/view?commNo=" + commBoard.getCommNo();
	}
	
	@RequestMapping("/download")
	public String download(CommFile commFile, Model model) {
		
		// 첨부파일 정보 객체
		commFile = commService.getFile(commFile);
		logger.debug("{}", commFile);
		
		// 모델값 전달
		model.addAttribute("downFile", commFile);
		
		return "downCommBoard";
	}
	
	@GetMapping("/update")
	public String update(CommBoard commBoard, Model model) {
		logger.debug("{}", commBoard);
		
		// 잘못된 게시글 번호 처리
		if( commBoard.getCommNo() < 0 ) {
			return "redirect:/comm/list";
		}
		
		// 게시글 조회
		commBoard = commService.view(commBoard);
		logger.debug("조회된 게시글 {}", commBoard);
		
		// 모델값 전달
		model.addAttribute("updateBoard", commBoard);
		
		// 첨부파일 모델값 전달
		CommFile commFile = commService.getAttachFile(commBoard);
		model.addAttribute("commFile", commFile);
		
		return "comm/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(CommBoard commBoard, MultipartFile file) {
		logger.debug("{}", commBoard);
		
		commService.update(commBoard, file);
		
		return "redirect:/comm/view?commNo=" + commBoard.getCommNo();
	}
	
	@RequestMapping("/delete")
	public String delete(CommBoard commBoard) {
		
		commService.delete(commBoard);
		
		return "redirect:/comm/list";
	}
	
	
	//----- 좋아요 ---------------------------------------------------------
	
	@PostMapping("/likeup")
	public String likeUp(CommLike like, Model model, HttpSession session) {
		
		like.setUserno((int) session.getAttribute("userno"));
		logger.debug("{}", like);
		
		commService.likeUp(like);
		
		CommBoard likeCnt = commService.likecnt(like);
		model.addAttribute("likeCnt", likeCnt);
		logger.debug("{}", likeCnt);
				
		return "/comm/likecnt";
	}
	
	@PostMapping("/likedown")
	public String likeDown(CommLike like, Model model, HttpSession session) {
		
		like.setUserno( (int) session.getAttribute("userno") );
		logger.debug("{}", like);
		
		commService.likeDown(like);
		
		CommBoard likeCnt = commService.likecnt(like);
		model.addAttribute("likeCnt", likeCnt);
		logger.debug("{}", likeCnt);
		
		return "/comm/likecnt";
	}
	
	
	//----- 신고 ---------------------------------------------------------
	
	@PostMapping("/report")
	public String reportProcess(CommReport commReport, HttpSession session) {
		logger.debug("{}", commReport);
		
		commReport.setUserno((int) session.getAttribute("userno"));
		
		// 게시글, 첨부파일 처리
		commService.report(commReport);
		
		return "redirect:/comm/list";
	}
	
	
	//----- 댓글 ---------------------------------------------------------
		
	@GetMapping("/cmtlist")
	public void cmtList(int commNo, Model model) {
		
		List<CommCmt> cmtList = commService.cmtList(commNo);
		
		model.addAttribute("cmtList", cmtList);
		
	}
	
	@PostMapping("/cmtwrite")
	public String cmtWrite(CommCmt commCmt, HttpSession session) {
		
		commCmt.setUserno( (int) session.getAttribute("userno") );
		commCmt.setCommCmtWriterNick( (String) session.getAttribute("nick") );
		
		commService.cmtWrite(commCmt);
		
		return "redirect:/comm/cmtList?commNo=" + commCmt.getCommNo();
	}
	
	@GetMapping("/cmtdelete")
	public String cmtDelete(CommCmt commCmt, Model model) {
		logger.debug("{}", commCmt);
		
		commService.cmtDelete(commCmt);
		
		List<CommCmt> cmtList = commService.cmtList(commCmt.getCommNo());
		
		model.addAttribute("cmtList", cmtList);
		
		return "redirect:/comm/view?commNo=" + commCmt.getCommNo();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
