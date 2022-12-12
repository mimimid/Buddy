package web.controller.msg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.msg.ChatRoom;
import web.service.face.msg.ChatRoomService;

@Controller
public class ChatRoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatRoomController.class);
	
	@Autowired private ChatRoomService chatRoomService;

		//채팅방 목록
		@RequestMapping(value = "/chatroom/list", method = RequestMethod.GET)
		public String chatroomList(Model model) {

			logger.info("/chatroom/list [GET]");
			
			List<Map<String,Object>> list = chatRoomService.list();
			logger.info("list : {}", list);
			model.addAttribute("list", list);
			return "/chat/roomlist";
		}
		
		//채팅방 만들기 
		@RequestMapping(value = "/chatroom/create", method = RequestMethod.GET)
		public String chatroomCreate(String chatroomName, HttpSession session) {

			logger.info("/chatroom/create [GET]");
			logger.info("chatroomName : {} ", chatroomName);
			//createUser아이디 가져오기
			//String userid = session.getAttribute("userid");
			String userid = "heejoo";
			ChatRoom chatRoom = new ChatRoom();
			chatRoom.setCreateUser(userid);	
			chatRoom.setChatroomName(chatroomName);
			
			//채팅방 만들기
			chatRoomService.createChatRoom(chatRoom);
			
			return "/chat/roomlist";
		}
		
		//채팅방 입장
		@RequestMapping(value = "/chatroom/enter", method = RequestMethod.GET)
		public String chatRoomEnter(HttpSession session) {

			logger.info("/chatroom/enter [GET]");
			//logger.info("chatroomName : {} ", chatroomName);
			//createUser아이디 가져오기
			//String userid = session.getAttribute("userid");
			String userid = "heejoo";
			ChatRoom chatRoom = new ChatRoom();

			
			return "/chat/chatRoomDetail";
		}
		

	

}
