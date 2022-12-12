package web.controller.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.AniUser;
import web.service.face.user.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired private UserService userService;
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String loginProc(AniUser user, HttpSession session) {
		
//		logger.debug("입력 받은 id pw : {}", user);
		
		//로그인 정보 확인
		boolean result = userService.login(user);
//		logger.debug("로그인 여부 : {}",result);
		
		
		if(result) {
			
			//로그인한 아이디의 정보 가져오기 
			AniUser userInfo = userService.getUserInfo(user);
			logger.debug("가저온 정보 : {}",userInfo);
			
			session.setAttribute("login", result);
			session.setAttribute("id", user.getUserid());
			session.setAttribute("userno", userInfo.getUserno());
			session.setAttribute("nick", userInfo.getUsernick());
			session.setAttribute("phone", userInfo.getPhone());
			session.setAttribute("name", userInfo.getUsername());
			session.setAttribute("gender", userInfo.getGender());
			session.setAttribute("grade", userInfo.getGrade());
			session.setAttribute("img", userInfo.getImgorigin());
			
			return "redirect:/";  
		}else {
			
			session.invalidate();
			return "redirect:/user/login";
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(String userid, Model model) {
		boolean chresult = userService.idCheck(userid);
		
		logger.debug("전달 데이터 확인 : {}",userid);
		logger.debug("아이디 중복 체크{}",chresult);
		
		model.addAttribute("chresult",chresult);
		
	}
	@PostMapping("/join")
	public String joinProc(AniUser user, MultipartFile img) {
//		logger.debug("{} ",user);
		logger.debug("{} ", img);
		
		boolean result = userService.join(user);
		
		userService.insertImg(user,img);
		
		if(result) {
			return "redirect:/";
			
		} else {
			return "redirect/user/join";
		}
		
	}
	
	@GetMapping("/idFind")
	public void idFind() {
		
	}
	
	@PostMapping("idFindProc")
	public void idFindProc(AniUser user, Model model) {
//		logger.debug("찾을 회원정보 : {}", user);
		
		String id = userService.findId(user);
		
//		logger.debug("찾은 회원 아이디 :{}", id );
		if(id != null ) {
			model.addAttribute("id", id);
		}else {
			model.addAttribute("id", null);
		}
	}
	
	@GetMapping("/pwFind")
	public void pwFind() {
		
	}
	
	@PostMapping("/pwFindProc")
	public void pwFindProc(AniUser user, Model model) {
		String pw = userService.findPw(user);
		
		if(pw != null ) {
			model.addAttribute("pw", pw);
		}else {
			model.addAttribute("pw", null);
		}
	}

}
