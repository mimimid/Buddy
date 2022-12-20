package web.controller.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/mypage/main")
	public void mypage() {
		
	}
	
}
