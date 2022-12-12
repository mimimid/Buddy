package web.service.impl.msg;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.msg.MsgDao;
import web.dto.msg.Msg;
import web.service.face.msg.MsgService;
@Service
public class MsgServiceImpl implements MsgService{
	
	private static final Logger logger = LoggerFactory.getLogger(MsgService.class);
	
	@Autowired MsgDao msgDao;

	@Override
	public void save(Msg msg) {
		logger.info("save() 호출: {}", msg);
		
		msgDao.insertMsg(msg);
	}

}
