package web.service.impl.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.admin.AdminDao;
import web.service.face.admin.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDao adminDao;

}
