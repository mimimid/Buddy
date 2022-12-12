package web.controller.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.notice.Ncomment;
import web.service.face.notice.NcommentService;
import web.service.face.notice.NlikeService;
import web.service.face.notice.NoticeService;

@Controller
public class NcommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(NcommentController.class);
	
	@Autowired private NcommentService ncommentService;
	@Autowired private NoticeService noticeService;
	@Autowired private NlikeService nlikeService;
	
//--------------------------------댓글 작성하기----------------------------------------------------------
	@RequestMapping(value = "/ncmt/write", method = RequestMethod.POST)
	public @ResponseBody void like(Ncomment ncomment) {
		logger.info("/ncmt/write [POST]");
		logger.info("ncommet : {}", ncomment);
		
		ncommentService.write(ncomment);
	}
	
//--------------------------------댓글 수정하기----------------------------------------------------------
	@RequestMapping(value = "/bcmt/modify", method = RequestMethod.POST)
	public @ResponseBody void modify(Ncomment bcomment) {
		logger.info("/bcmt/modify [POST]");
		logger.info("bcommetn : {}", bcomment);
		
		ncommentService.modify(bcomment);
	}
	
	//--------------------------------댓글 삭제하기----------------------------------------------------------
		@RequestMapping(value = "/ncmt/delete", method = RequestMethod.POST)
		public @ResponseBody void delete(Ncomment ncomment) {
			logger.info("/bcmt/delete [POST]");
			logger.info("bcommetn : {}", ncomment);
			
			ncommentService.delete(ncomment);
		}
	
//----------------------boardno 받아 댓글 리스트(최신순, 추천순) 불러오기-------------------------------------------
	@RequestMapping(value = "/ncmt/cmtList", method = RequestMethod.GET)
	public String listByDate(int noticeno, String selectedOption, Model model) {
		logger.info("/ncmt/cmtList [GET]");
		logger.info("noticeno : {}", noticeno);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		if(selectedOption.equals("byRecent")) {
			list = ncommentService.listByRecent(noticeno);
		} else {
			list = ncommentService.listByLike(noticeno);
		}
		
		model.addAttribute("list", list);
//		logger.info("list: {}", list);
//		logger.info("list size : {}", list.size());
		model.addAttribute("size", list.size());
		
		//댓글 좋아요 했는지 안했는지 검사 - 이 회원이 이 글에서 좋아요한 댓글들 번호들 불러오기
//		String userid = (String) session.getAttribute("userid");
//		logger.info("userId"+userid);
		String userid = "heejoo";
		List<Map<String, Object>> likedCmtNoList = ncommentService.likedCmtNo(userid,noticeno);
		logger.info("likedCmtNoList: {}", likedCmtNoList);
		model.addAttribute("likedCmtNoList", likedCmtNoList);
		model.addAttribute("userid", userid);
		
		return "notice/commentList";
	}

//------------------------------------댓글 좋아요------------------------------------------------------

	@RequestMapping(value = "/ncmt/like", method = RequestMethod.POST)
	public @ResponseBody void cmtLike(int ncmtno) {
		logger.info("/ncmt/like [GET]");
		logger.info("ncmtno : {}", ncmtno);
//		String userid = (String) session.getAttribute("userid");
//		logger.info("userId"+userid);
		String userid = "heejoo";
		
		ncommentService.like(ncmtno, userid);


	}
//------------------------------------댓글 싫어요------------------------------------------------------

	@RequestMapping(value = "/ncmt/dislike", method = RequestMethod.POST)
	public @ResponseBody void cmtDisLike(int ncmtno) {
		logger.info("/ncmt/like [GET]");
		logger.info("ncmtno : {}", ncmtno);
//		String userid = (String) session.getAttribute("userid");
//		logger.info("userId"+userid);
		String userid = "heejoo";
		
		ncommentService.disLike(ncmtno);

	}
}
