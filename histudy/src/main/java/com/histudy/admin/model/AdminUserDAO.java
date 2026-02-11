package com.histudy.admin.model;

import java.util.*;
import com.histudy.user.model.*;

public interface AdminUserDAO {
	public List<UserDTO> selectAllUserList();
	public int getUserCount();
	public int deleteUser(int user_idx);
}
