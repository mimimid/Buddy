package web.controller.adopt;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.AdoptPro;
import web.service.face.adopt.AdoptService;
import web.util.Paging;

@Controller
@RequestMapping("/adopt")
public class AdoptController {
		
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired AdoptService adoptService;
		
		@RequestMapping("/pro")
		public void AdoptPro(
				@RequestParam(defaultValue = "0") int curPage
				, Model model ) {
			
			Paging paging = adoptService.getProPaging(curPage);
			logger.debug("{}", paging);
			model.addAttribute("paging", paging);
			
			List<AdoptPro> list = adoptService.proList(paging);
			for( AdoptPro a : list )	logger.debug("{}", a);
			model.addAttribute("list", list);
	}
	
	@PostMapping("/pro")
	public void AdoptPro_ajax() {
		
	}
	
	@RequestMapping("/proView")
	public void AdoptProview() {
		
	}
	
	@GetMapping("/proWrite")
	public void write() {}
	
//	@PostMapping("/proWrite")
//	public String writeProcess(Board board, MultipartFile file, HttpSession session) {
//		logger.debug("{}", board);
//		logger.debug("{}", file);
//		
//		//작성자 정보 추가
//		board.setWriterId( (String) session.getAttribute("id") );
//		board.setWriterNick( (String) session.getAttribute("nick") );
//		logger.debug("{}", board);
//		
//		//게시글, 첨부파일 처리
//		boardService.write(board, file);
//		
//		return "redirect:/board/list";
//	}
	
	
	
	
	

}
