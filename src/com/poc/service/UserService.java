package com.poc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poc.db.model.Assess;
import com.poc.db.model.Claim;
import com.poc.db.model.ClaimUserViewCommand;
import com.poc.db.model.Policy;
import com.poc.db.model.User;

public interface UserService {
   public String userLogin(String uid, String upassword,HttpServletResponse response);
   
   public List<Policy> showAllPolicyByUserId(HttpServletRequest request);
   
   public void insertClaim(Claim claim,HttpServletRequest request);
   
   public List<Assess> showAssess(Assess assess,HttpServletRequest request);
   
   public List<ClaimUserViewCommand> showClaims(HttpServletRequest request);
}
