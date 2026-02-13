package com.histudy.admin.service;

import java.util.*;
import com.histudy.user.model.*;

public interface AdminUserService {
	public List<UserDTO> getUserList();
	public int getUserCount();
	public int deleteUser(int user_idx);
}