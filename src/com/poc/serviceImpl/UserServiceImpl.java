package com.poc.serviceImpl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sun.security.util.Password;

import com.poc.db.dao.ClaimMapper;
import com.poc.db.dao.PolicyMapper;
import com.poc.db.dao.UserMapper;
import com.poc.db.dao.AssessMapper;
import com.poc.db.model.Assess;
import com.poc.db.model.Claim;
import com.poc.db.model.ClaimUserViewCommand;
import com.poc.db.model.Policy;
import com.poc.db.model.User;
import com.poc.service.UserService;
import com.poc.util.CookieUtil;
import com.poc.util.EncoderByMd5;
import com.poc.util.JSONUtils;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;
import com.thoughtworks.xstream.mapper.Mapper.Null;
@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PolicyMapper policyMapper;
	
	@Autowired
	private ClaimMapper claimMapper;
	
	@Autowired
	private AssessMapper assessMapper;
	
	
	
	
	@Override
	public String userLogin(String uid, String upassword,HttpServletResponse response) {
		// TODO Auto-generated method stub
		String md5Password = "";
		try {
			md5Password = EncoderByMd5.EncoderByMd5(upassword);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(JSONUtils.toJSONString(userMapper.userLogin(uid,md5Password)));
		if(!JSONUtils.toJSONString(userMapper.userLogin(uid,md5Password)).equals("[null]")){	
			//System.out.println(userMapper.userLogin(uid,md5Password).getName());
			//cookie中不能存储中文
			/*CookieUtil.addCookie(response, "loginedUserName",userMapper.userLogin(uid,md5Password).getName(), 3600);*/
			CookieUtil.addCookie(response, "loginedUserId",userMapper.userLogin(uid,md5Password).getUid(), 3600);
			//return userMapper.userLogin(uid,md5Password);
			return "success";
		}else{
			return "fail";
		}
	}

	@Override
	public List<Policy> showAllPolicyByUserId(HttpServletRequest request) {
		return policyMapper.showAllPolicyByUserId(CookieUtil.getCookieByName(request,"loginedUserId").getValue().split(",")[0]);
	}

	@Override
	public void insertClaim(Claim claim,HttpServletRequest request) {
		// TODO Auto-generated method stub
		claim.setApplyUser(CookieUtil.getCookieByName(request,"loginedUserId").getValue().split(",")[0]);
		claim.setStatus("0");//0表示用户申请,1表示审核成功
		Date date = new Date();
		SimpleDateFormat myformat = new SimpleDateFormat("yyyy-MM-dd");
		claim.setClaimTime(myformat.format(date));
		claimMapper.insert(claim); 
	}

	@Override
	public List<Assess> showAssess(Assess assess,HttpServletRequest request) {
		// TODO Auto-generated method stub
		assess.setApplyUser(CookieUtil.getCookieByName(request,"loginedUserId").getValue().split(",")[0]);
		return assessMapper.showAssess(assess);
	}

	@Override
	public List<ClaimUserViewCommand> showClaims(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Claim claim = new Claim();
		claim.setApplyUser(CookieUtil.getCookieByName(request,"loginedUserId").getValue().split(",")[0]);
		return claimMapper.showClaimUserViewCommand(claim);
	}
}
