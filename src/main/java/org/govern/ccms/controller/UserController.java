/**
 * 
 */
package org.govern.ccms.controller;

import org.govern.ccms.dao.UserDao;
import org.govern.ccms.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

/**
 * @author zqjiang
 *
 */
@Controller
public class UserController implements InitializingBean {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserDao dao;
	@Value("${db.mariadb.jdbc.url}")
	private String jdbc;

	/* (non-Javadoc)
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		User user = dao.getUser(1);
		logger.info("user : " + user.toString());
		logger.info("jdbc : " + jdbc);
	}
	
	
}
