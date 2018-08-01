import static org.junit.Assert.*;

import org.junit.Test;

import com.xymovie.po.User;
import com.xymovie.service.UserService;

public class testUserService {

	@Test
	public void testAddUser() {
		User user = new User("124479","password","黄祖珏");
		UserService.addUser(user);
	}

}
