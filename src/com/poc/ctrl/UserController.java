package com.poc.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poc.db.model.Assess;
import com.poc.db.model.Claim;
import com.poc.service.UserService;
import com.poc.util.JSONUtils;

@Controller
public class UserController {
 @Autowired
 private UserService userService;
 
 
 @ResponseBody
 @RequestMapping(value="/login", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
 public String userLogin(@RequestParam String uid,@RequestParam String upassword,HttpServletResponse response){ 
	return userService.userLogin(uid, upassword,response);
 }
 
 @ResponseBody
 @RequestMapping(value="/showAllPolicyByUserId", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
 public String showAllPolicyByUserId(@RequestParam String uid,HttpServletRequest request){ 
	 //System.out.println(userService.showAllPolicyByUserId(uid).toString());
	return JSONUtils.toJSONString(userService.showAllPolicyByUserId(request));
 }

@ResponseBody
@RequestMapping(value="/insertClaim", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public void insertClaim(Claim claim,HttpServletRequest request){
	System.out.println(claim.toString());
	userService.insertClaim(claim, request);
}


@ResponseBody
@RequestMapping(value="/showAssess", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public String showAssess(Assess assess,HttpServletRequest request){ 
	return JSONUtils.toJSONString(userService.showAssess(assess, request));
}

@ResponseBody
@RequestMapping(value="/showClaims", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public String showClaims(Claim claim,HttpServletRequest request){ 
	return JSONUtils.toJSONString(userService.showClaims(claim, request));
	//return JSONUtils.toJSONString(userService.showAssess(assess, request));
}
}
