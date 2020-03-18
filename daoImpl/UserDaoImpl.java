package com.tps.mng.dao.impl;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import com.tps.mng.dao.UserDao;
import com.tps.mng.entity.User;
import com.tps.mng.entity.Eigyou;
import com.tps.mng.dto.UserAllInfoDto;
import com.tps.mng.entity.GenbaHistory;

public class UserDaoImpl implements UserDao {

   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession){
      this.sqlSession = sqlSession;
   }

   @Override
   public int inserUser(User user) {
      return sqlSession.insert(
            "com.tps.mng.mapper.xml.UserMapper.insertUser", user);
   }

	@Override
	public List<Eigyou> eigyouListSelect() {
		return sqlSession.selectList("com.tps.mng.mapper.xml.UserMapper.selectEigyouList");
	}

	private static final String namespace = "com.tps.mng.mapper.xml.UserMapper";

	@Override
	public UserAllInfoDto selectUser(int userId) {
		return sqlSession.selectOne(namespace+".selectUser", userId);
	}

	@Override
	public int editUser(User user) {
		return sqlSession.update(namespace+".editUser", user);
	}

	@Override
	public int retireUser(User user) {
		return sqlSession.update(namespace+".retireUser", user);
	}

	@Override
	public int updateGenbaHistory(GenbaHistory genbaHistory) {
		return sqlSession.update(namespace+".updateGenbaHistory", genbaHistory);
	}

	@Override
	public int genbaNasiEditUser(User user) {
		return sqlSession.update(namespace+".genbaNasiEditUser", user);
	}

	@Override
	public int genbaHistoryShusei(int id) {
		return sqlSession.update(namespace+".genbaHistorySyusei", id);
	}

	@Override
	public int insertGenbaHistory(GenbaHistory genbaHistory) {
		return sqlSession.insert(namespace+".insertGenbaHistory2", genbaHistory);
	}
}
