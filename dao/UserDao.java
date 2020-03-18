package com.tps.mng.dao;

import java.util.List;

import com.tps.mng.entity.User;
import com.tps.mng.entity.Eigyou;
import com.tps.mng.dto.UserAllInfoDto;
import com.tps.mng.entity.GenbaHistory;

public interface UserDao {
	public int inserUser(User user);
	public List<Eigyou> eigyouListSelect();

	public UserAllInfoDto  selectUser(int userId);

	public int			   insertGenbaHistory(GenbaHistory genbaHistory);

	public int			   genbaNasiEditUser(User user);

	public int             updateGenbaHistory(GenbaHistory genbaHistory);

	public int             genbaHistoryShusei(int id);

	public int             editUser(User user);

	public int             retireUser(User user);
}
