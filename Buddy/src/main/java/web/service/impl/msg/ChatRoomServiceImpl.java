package web.service.impl.msg;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.msg.ChatRoomDao;
import web.dto.ChatRoom;
import web.service.face.msg.ChatRoomService;
@Service
public class ChatRoomServiceImpl implements ChatRoomService{
	
	private static final Logger logger = LoggerFactory.getLogger(ChatRoomService.class);
	
	@Autowired ChatRoomDao chatRoomDao;

	@Override
	public void createChatRoom(ChatRoom chatroom) {

		chatRoomDao.insertChatRoom(chatroom);
	}

	@Override
	public List<Map<String, Object>> list() {

		return chatRoomDao.selectAll();
	}

}
