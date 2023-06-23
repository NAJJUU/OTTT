package com.ottt.ottt.service.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.user.UserDao;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.dto.UserOTTDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	//유저 id로 회원 찾기
	@Override
	public UserDTO getUser(String user_id) throws Exception {
		return userDao.select(user_id);
	}

	//유저정보 전체 받기
	@Override
	public List<UserDTO> getAllUser() throws Exception {
		return userDao.selectAll();
	}

	//유저정보 삭제
	@Override
	public int bye(Integer user_no, String user_id) throws Exception {
		return userDao.delete(user_no, user_id);
	}

	//유저정보 전부 변경
	@Override
	public int modify(UserDTO userDTO) throws Exception {
		return userDao.update(userDTO);
	}

	//유저 닉네임 변경
	@Override
	public int mod_nick(UserDTO userDTO) throws Exception {
		return userDao.up_nicknm(userDTO);
	}

	//유저 id로 user_no 찾기
	@Override
	public int getUserNo(String user_id) throws Exception {
		return userDao.selectUserNo(user_id);
	}

	//중복된 닉네임 여부
	@Override
	public int selectNicknmCnt(String user_nicknm) throws Exception {
		return userDao.selectNicknmCnt(user_nicknm);
	}

	//유저 비밀번호 변경
	@Override
	public int mod_pwd(UserDTO userDTO) throws Exception {
		return userDao.up_pwd(userDTO);
	}
	
	//유저 프로필 이미지 변경
	@Override
	public int mod_img(UserDTO userDTO) throws Exception {
		return userDao.up_profile(userDTO);
	}

	@Override
	public UserDTO getUser(Integer user_no) throws Exception {
		return userDao.select(user_no);
	}

	@Override
	public int putUserOTT(Map map) throws Exception {
		// TODO Auto-generated method stub
		return userDao.insertUserOTT(map);
	}

	@Override
	public int putUserGenre(Map map) throws Exception {
		// TODO Auto-generated method stub
		return userDao.insertUserGenre(map);
	}

	@Override
	public UserDTO getUserEmail(String user_email) throws Exception {
		return userDao.selectEmail(user_email);
	}

	@Override
	public UserDTO getFindPwd(String user_email, String user_id) throws Exception {
		return userDao.selectPwd(user_email, user_id);
	}

	@Override
	public int resetPwd(String user_id, String user_pwd) throws Exception {
		return userDao.resetPwd(user_id, user_pwd);
	}
}
