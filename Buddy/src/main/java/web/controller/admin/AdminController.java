package web.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import web.service.face.admin.AdminService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminService adminService;

	@GetMapping("/admin")
	public String login() {
		
		return "admin/login";
	}

	@GetMapping("/admin/main")
	public void main() {}
	
	
}
