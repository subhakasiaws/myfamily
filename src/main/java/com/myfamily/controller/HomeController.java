package com.myfamily.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myfamily.model.User;
import com.myfamily.model.UserDetails;
import com.myfamily.service.UserService;
 
/**
 * @author Chandra
 *
 */
@Controller
public class HomeController {

	private static final Logger LOG = LogManager.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
    @RequestMapping("/")
    public String login(){
        return "redirect:login?lang=te";
    }

    @RequestMapping("/login")
    public String loginWithLocale(){
        return "login";
    }
    
    @RequestMapping(value="/home", method=RequestMethod.POST)
    public ModelAndView home(String name) {
    
    LOG.info("HomeController method home-started "+name);
     ModelAndView model = new ModelAndView();
     model.addObject("name", name);
     model.setViewName("home");
     User user = new User();
     user.setName(name);
     Boolean flag = userService.addUser(user);
     LOG.info("HomeController method home -end ");
     return model;
    }
    
    @RequestMapping("/calendar")
    public String Calendar(){
        return "calendar";
    }
    @RequestMapping("/tasks")
    public String Task(){
        return "task";
    }
    @RequestMapping("/board")
    public String Board(){
        return "board";
    }
    
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<List<UserDetails>> userDetails() {
        
		List<UserDetails> userDetails = userService.getUserDetails();
		return new ResponseEntity<List<UserDetails>>(userDetails, HttpStatus.OK);
	}
}
