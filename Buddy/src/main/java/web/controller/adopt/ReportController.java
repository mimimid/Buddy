package web.controller.adopt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
			
	@RequestMapping("/rr")
	public void rr() {
		logger.debug("시작");
	}
	

}
