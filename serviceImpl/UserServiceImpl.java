package com.tps.mng.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.tps.mng.dao.UserDao;
import com.tps.mng.dto.EigyouDto;
import com.tps.mng.dto.UserDto;
import com.tps.mng.entity.Eigyou;
import com.tps.mng.entity.User;
import com.tps.mng.service.UserService;
import com.tps.mng.dto.UserAllInfoDto;
import com.tps.mng.entity.GenbaHistory;
import com.tps.mng.service.GenbaService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Resource
	private GenbaService genbaService;

	@Override
	public int insertUser(UserDto userDto) {

		User user = new User();

		user.setUserKanjiName(userDto.getUserKanjiName());
		user.setUserKanaName(userDto.getUserKanaName());
		user.setUserKorName(userDto.getUserKorName());
		user.setUserEngName(userDto.getUserEngName());
		user.setUserSyainBango(userDto.getUserSyainBango());
		user.setUserEigyoubango(userDto.getUserEigyoubango());
		user.setUserEkki(userDto.getUserEkki());
		user.setUserNyuusyabi(userDto.getUserNyuusyabi());
		user.setUserYakushoku(userDto.getUserYakushoku());
		user.setUserStatus(userDto.getUserStatus());
		user.setUserKeyman(userDto.getUserKeyman());
		user.setUserRenkeikikan(userDto.getUserRenkeikikan());
		user.setUserMemo(userDto.getUserMemo());
		user.setUserBikou(userDto.getUserBikou());

		return userDao.inserUser(user);
	}

	@Override
	public List<EigyouDto> getEigyouSelect() {
		List<Eigyou> listFound = userDao.eigyouListSelect();
		List<EigyouDto> listToReturn = new ArrayList<EigyouDto>();

				for(Eigyou eigyou : listFound){
					EigyouDto eigyouDto = new EigyouDto();
					BeanUtils.copyProperties(eigyou, eigyouDto);
					listToReturn.add(eigyouDto);
				}

				return listToReturn;
	}

	@Override
	public UserAllInfoDto userModifyInit(int userId) {
		UserAllInfoDto userAllInfoDto;
		userAllInfoDto = userDao.selectUser(userId);
		return userAllInfoDto;
	}

	@Override
	public UserAllInfoDto selectUser(int userId) {
		UserAllInfoDto userAllInfoDto = new UserAllInfoDto();
		userAllInfoDto = userDao.selectUser(userId);
		return userAllInfoDto;
	}

	@Override
	public int retireUser(UserDto userDto) {
		User user = new User();

		BeanUtils.copyProperties(userDto, user);
		user.setUserId(userDto.getUserId());
		user.setUserStatus(userDto.getUserStatus());
		user.setUserTaisyokubi(userDto.getUserTaisyokubi());

		return userDao.retireUser(user);
	}

	@Override
	public int retireUserStatus(GenbaHistory genbaHistory) {
		int id = genbaHistory.getUserId();
		genbaHistory.setGenbaHistoryStatus(genbaHistory.getGenbaHistoryStatus());

		return userDao.genbaHistoryShusei(id);
	}

	@Override
	public int editUser(UserAllInfoDto userAllInfoDto) {
		int updateSeyikou = 1;
		User user = new User();
		GenbaHistory genbaHistory = new GenbaHistory();
		BeanUtils.copyProperties(userAllInfoDto, user);
		BeanUtils.copyProperties(userAllInfoDto, genbaHistory);

		user.setUserEigyouId(userAllInfoDto.getEigyouId());

		if (userAllInfoDto.getUserStatus() == 3) {

			userDao.genbaNasiEditUser(user);
			if (userAllInfoDto.getUserStatus() == 3
					&& userAllInfoDto.getUserGenbaId() == 0) {

				genbaHistory.setEigyouId(userAllInfoDto.getEigyouId());
				userDao.genbaNasiEditUser(user);
				userDao.insertGenbaHistory(genbaHistory);

			}
		} else if (userAllInfoDto.getUserStatus() == 2
				&& genbaHistory.getUserGenbaId() != 0) {

			genbaHistory.setUserId(userAllInfoDto.getUserId());
			userDao.editUser(user);
			userDao.updateGenbaHistory(genbaHistory);
		}
		return updateSeyikou;
	}

}
