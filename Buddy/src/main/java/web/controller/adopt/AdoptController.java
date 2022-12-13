package web.controller.adopt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adopt")
public class AdoptController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/pro")
	public void AdoptPro() {
		logger.debug("pro");
		
	}
	
	@PostMapping("/pro")
	public void AdoptPro_ajax() {
		
	}
	
	@RequestMapping("/proView")
	public void AdoptProview() {
		
	}
	
	
	
	
	
	

}
