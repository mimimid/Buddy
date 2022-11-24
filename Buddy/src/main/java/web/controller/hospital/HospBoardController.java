package web.controller.hospital;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HospBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/hospboard/hblist")
	public void hrboardList() {
		logger.debug("시작");
		
	}
}
