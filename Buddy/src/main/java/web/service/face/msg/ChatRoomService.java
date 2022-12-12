package web.service.face.msg;

import java.util.List;
import java.util.Map;

import web.dto.msg.ChatRoom;

public interface ChatRoomService {
	
	public void createChatRoom(ChatRoom chatroom);
	
	public List<Map<String,Object>> list();

}
