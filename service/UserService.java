package com.tps.mng.service;

import java.util.List;
import com.tps.mng.dto.EigyouDto;
import com.tps.mng.dto.UserAllInfoDto;
import com.tps.mng.dto.UserDto;
import com.tps.mng.entity.GenbaHistory;

public interface UserService {

	public int insertUser(UserDto userDto);

	public List<EigyouDto> getEigyouSelect();

	public UserAllInfoDto  userModifyInit(int userId);

	public int 			   editUser(UserAllInfoDto userAllInfoDto);

	public UserAllInfoDto  selectUser(int userId);

	public int 			   retireUser(UserDto userDto);

	public int		   	   retireUserStatus(GenbaHistory genbaHistory);

}
