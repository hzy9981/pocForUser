package com.poc.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poc.db.model.Assess;
import com.poc.db.model.Claim;
import com.poc.db.model.Policy;
import com.poc.service.UserService;
import com.poc.util.JSONUtils;

@Controller
public class UserController {
	
	protected Log log = LogFactory.getLog(getClass());
	
 @Autowired
 private UserService userService;
 
 
 @ResponseBody
 @RequestMapping(value="/login", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
 public String userLogin(@RequestParam String uid,@RequestParam String upassword,HttpServletResponse response){ 
	return userService.userLogin(uid, upassword,response);
 }
 
 @ResponseBody
 @RequestMapping(value="/showAllPolicyByUserId", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
 public String showAllPolicyByUserId(Policy policy,HttpServletRequest request){ 
	return JSONUtils.toJSONString(userService.showAllPolicyByUserId(policy,request));
 }

@ResponseBody
@RequestMapping(value="/insertClaim", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public void insertClaim(Claim claim,HttpServletRequest request){
	userService.insertClaim(claim, request);
}


@ResponseBody
@RequestMapping(value="/showAssess", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public String showAssess(Assess assess,HttpServletRequest request){ 
	return JSONUtils.toJSONString(userService.showAssess(assess, request));
}

@ResponseBody
@RequestMapping(value="/showClaims", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
public String showClaims(HttpServletRequest request){ 
	return JSONUtils.toJSONString(userService.showClaims(request));
}
}
