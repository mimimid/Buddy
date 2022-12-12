package web.dao.face.msg;

import java.util.List;
import java.util.Map;

import web.dto.msg.ChatRoom;

public interface ChatRoomDao {

	public void insertChatRoom(ChatRoom chatroom);
	
	public List<Map<String, Object>> selectAll();
	
	
}
