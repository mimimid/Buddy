package web.controller.shopping;

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
import org.springframework.web.multipart.MultipartFile;

import web.dto.AniProduct;
import web.service.face.shopping.ShoppingService;
import web.util.Paging;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired private ShoppingService shoppingService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		Paging paging = shoppingService.getPaging(curPage);
//		logger.debug("페이징 계산 : {}", paging);
		model.addAttribute("paging",paging);
		
		List<AniProduct> list = shoppingService.getList(paging);
//		logger.debug("리스트 계산 : {}", list);
		model.addAttribute("list",list);
		
		
	}
	
	@GetMapping("/input")
	public void input() {
		
	}
	
	@PostMapping("/input")
	public String inputProc(AniProduct product, MultipartFile img) {
		logger.debug("입력받은 내용 : {}", product);
		logger.debug("입력받은 이미지 : {}", img);
		
		shoppingService.input(product, img);
		
		return "redirect:/shopping/list";
	}

}
