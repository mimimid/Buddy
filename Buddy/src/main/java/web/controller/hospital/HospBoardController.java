package web.controller.hospital;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.HospBoard;
import web.dto.HospbCmt;
import web.dto.HospbFile;
import web.dto.HospbLike;
import web.dto.HospbPaging;
import web.service.face.hospital.HospBoardService;

@Controller
@RequestMapping("/hospboard")
public class HospBoardController {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HospBoardService hospBoardService;
	
	
	@GetMapping("/hblist")
	public String hospBoardList(
			@RequestParam(required = false) String animal, 
			@RequestParam(required = false) String category, 
			@RequestParam(required = false) String searchType, 
			@RequestParam(required = false) String keyWord, 
			@RequestParam(defaultValue = "0") int curPage
			, Model model
			, HttpSession session
			) {
		
		HospbPaging hospbPaging = hospBoardService.getPaging(animal,category,searchType,keyWord, curPage);
		hospbPaging.setAnimal(animal);
		hospbPaging.setCategory(category);
		hospbPaging.setSearchType(searchType);
		hospbPaging.setKeyWord(keyWord);
		
		logger.debug("paging : {}", hospbPaging);
		
		List<HospBoard> hbList = hospBoardService.list(hospbPaging);
			
		model.addAttribute("hbList", hbList);
		model.addAttribute("paging", hospbPaging);

			
		return "hospboard/hblist";
	}
	
	
	@PostMapping("/hblist")
	public String hospBoardListSearchProc(
			@RequestParam(required = false) String animal, 
			@RequestParam(required = false) String category, 
			@RequestParam(required = false) String searchType, 
			@RequestParam(required = false) String keyWord, 
			@RequestParam(defaultValue = "0") int curPage
			, Model model
			, HttpSession session
			) {
		
		HospbPaging hospbPaging = hospBoardService.getPaging(animal,category,searchType,keyWord, curPage);
		hospbPaging.setAnimal(animal);
		hospbPaging.setCategory(category);
		hospbPaging.setSearchType(searchType);
		hospbPaging.setKeyWord(keyWord);
		
		logger.debug("paging : {}", hospbPaging);
		
		List<HospBoard> hbList = hospBoardService.list(hospbPaging);
	
		model.addAttribute("hbList", hbList);
		model.addAttribute("paging", hospbPaging);
//		
//		//임시 세션
//		session.setAttribute("userid", "testID02");
//		session.setAttribute("userno", 2);
//		session.setAttribute("usernick", "닉네임2");
//		session.setAttribute("login", true);
//	
		return "hospboard/hblist";
	}
	
	
	@GetMapping("/hbview")
	public String view( HospBoard viewBoard, Model model, HttpSession session) {

		viewBoard = hospBoardService.view(viewBoard);
		logger.debug("조회된 게시글 {}", viewBoard);

		HospbFile boardfile = hospBoardService.getAttachFile(viewBoard);
		
		int like = 0;
		if(session.getAttribute("login") != null) {
			int userno = (int) session.getAttribute("userno");
		}
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		model.addAttribute("boardFile", boardfile);
		model.addAttribute("like", like);
		
		
		return "hospboard/hbview";
	}
	

	@GetMapping("/hbwrite")
	public void write(HttpSession session) {	}
	
	@PostMapping("/hbwrite")
	public String writeProc( HospBoard board, MultipartFile file, HttpSession session) {
		logger.debug("작성글 : {}",board);
		logger.debug("파일 : {}",file);

		board.setUserno((int) session.getAttribute("userno"));
		logger.debug("{}", board);
		
		hospBoardService.write(board,file);
		
		
		return "redirect:/hospboard/hblist";
	}
	
	@RequestMapping("/download")
	public String download(HospbFile hospbfile, Model model) {
		
		hospbfile = hospBoardService.getFile(hospbfile);
		logger.debug("{}", hospbfile);
		
		model.addAttribute("downFile", hospbfile);
		
		return "downHospBoard";
	}
	
	
	
	@GetMapping("/hbupdate")
	public String update(HospBoard board, Model model) {
		logger.debug("글번호 : {}", board);

		if( board.getHbno() < 0 ) {
			return "redirect:/hospboard/hblist";
		}		

		board = hospBoardService.view(board);

		model.addAttribute("updateBoard", board);

		HospbFile hospbFile = hospBoardService.getAttachFile(board);
		model.addAttribute("boardFile", hospbFile);
			
		return "hospboard/hbupdate";	
	}
	
	
	@PostMapping("/hbupdate")
	public String updateProc(HospBoard board, MultipartFile file) {
		logger.debug("{}", board);
		
		hospBoardService.update(board, file);
		
		return "redirect:/hospboard/hbview?hbno="+board.getHbno();
	}
	
	
	@RequestMapping("/hbdelete")
	public String delete (HospBoard board) {
		
		hospBoardService.delete(board);
		
		return "redirect:/hospboard/hblist";
	}
	
	
	
	@PostMapping("/hbview/likeup")
	public @ResponseBody void likeUp( HospbLike like, HttpSession session) {
		
		like.setUserno((int) session.getAttribute("userno"));
		logger.debug("좋아요 정보 {}", like);
		
		hospBoardService.likeUp(like);
	}
	
	@PostMapping("/hbview/likedown")
	public @ResponseBody void likeDown( HospbLike like, HttpSession session) {
		
		like.setUserno((int) session.getAttribute("userno"));
		logger.debug("좋아요 정보 {}", like);
		
		hospBoardService.likeDown(like);
	}	

	@GetMapping("/hbcmtlist")
	public String hbCmtList(int hbno, HttpSession session,Model model) {
		
		List<HospbCmt> cmtList = hospBoardService.cmtList(hbno);
		
		model.addAttribute("cmtList", cmtList);
		
		return"hospboard/hbcmtlist";
	}
	
	@PostMapping("/hbcmtwrite")
	public String hbCmtWrite( HospbCmt hospbCmt, HttpSession session) {
		
		hospbCmt.setUserid((String)session.getAttribute("userid"));
		hospbCmt.setUserno((int) session.getAttribute("userno"));
		
		hospBoardService.cmtWrite(hospbCmt);
		
		return "redirect:/hospboard/hbcmtlist?hbno="+hospbCmt.getHbno();
	}
	
	
	@GetMapping("/hbcmtdelete")
	public String hbCmtDelete(HospbCmt hospbCmt, Model model) {
		logger.debug("{}", hospbCmt);
		hospBoardService.cmtDelete(hospbCmt);
		
		List<HospbCmt> cmtList = hospBoardService.cmtList(hospbCmt.getHbno());
		
		model.addAttribute("cmtList", cmtList);
		
		return "redirect:/hospboard/hbcmtlist?hbno="+hospbCmt.getHbno();
	}	
	
	
	
	
}
