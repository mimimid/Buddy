package web.controller.msg;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Msg;
import web.service.face.msg.MsgService;

@Controller
public class MsgController {
	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Autowired private MsgService msgService;

		@RequestMapping(value = "/msg/sent", method = RequestMethod.POST)
		public @ResponseBody void msg(Msg msg) {
			logger.info("/msg/sent [POST]");
			logger.info("msg : {}", msg);
			
			msgService.save(msg);
			
		}
		
		@RequestMapping(value = "/msg/get", method = RequestMethod.GET)
		public void msgget() {
			logger.info("/msg/get [GET]");
			
		}
	
	
	
	

}
