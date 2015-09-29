/**
 * 
 */
package org.govern.ccms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.govern.ccms.dao.UserDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zqjiang
 *
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserDao dao;
	@RequestMapping(value = "login")
	public String login(HttpServletRequest request, HttpServletResponse response, Object cmd, BindException errors) throws Exception {
		LoginCommand command = (LoginCommand) cmd;
		logger.info(cmd.toString());
        UsernamePasswordToken token = new UsernamePasswordToken(command.getUsername(), command.getPassword());
        logger.info(command.getUsername());

        try {
            SecurityUtils.getSubject().login(token);
            logger.info(command.getUsername()+"|µÇÂ¼³É¹¦£¡");
        } catch (AuthenticationException e) {
        	logger.error("Error authenticating.", e);
            errors.reject("error.invalidLogin", "The username or password was not correct.");
        }
		return "index";
	}
}
