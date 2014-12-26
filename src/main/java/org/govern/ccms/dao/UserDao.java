/**
 * 
 */
package org.govern.ccms.dao;

import org.govern.ccms.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zqjiang
 *
 */
@Repository  
@Transactional
public interface UserDao {

	public User getUser(int userId);
}
