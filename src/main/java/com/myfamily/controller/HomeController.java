package com.myfamily.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myfamily.config.MyFamilyUtil;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;
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
    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    public ModelAndView home(String name,Integer userId, Boolean isFromLogin) {
    
    LOG.info("HomeController method home-started "+name);
   
    ModelAndView model = new ModelAndView();
     model.addObject("userId", userId);
     model.addObject("name", name);
     model.setViewName("home");

     if(isFromLogin) {
     	User user = new User();
         user.setName(name);
        Integer id = userService.addUser(user);
         model.addObject("name", name);
         Leaderboard ll = new Leaderboard();
         ll.setName(name);
         ll.setPoints(0);
         ll.setUserId(id);
         
         Leaderboard leaderboard = userService.creaditPoints(ll);
         
         model.addObject("userId", leaderboard.getId());
         List<Leaderboard> userList= userService.findAll();
         model.addObject("users",userList);
         model.addObject("points",leaderboard.getPoints());
         model.addObject("isFromLogin",true);
     }else {
         List<Leaderboard> userList= userService.findAll();
         model.addObject("users",userList);
         Leaderboard ll = MyFamilyUtil.getCurrentUser(userList,name);
         model.addObject("points",ll.getPoints());
         model.addObject("isFromLogin",false);
     }
     
     LOG.info("HomeController method home -end ");
     return model;
    }
    
    @RequestMapping("/calendar")
    public String Calendar(){
        return "calendar";
    }
    
    @RequestMapping("/shopping")
    public String shopping(){
        return "shopping";
    }
    
    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    public String Task(){
        return "task";
    }
    @RequestMapping("/board")
    public String Board(){
        return "board";
    }
    
    @RequestMapping(path="/creditPoints", method= RequestMethod.GET)
    public ResponseEntity creditPoints(@ModelAttribute(value="leaderboard") Leaderboard leaderboard) {
    LOG.info("HomeController method creditPoints ");
    System.out.println(leaderboard); 
    Integer totalPoints = userService.updateLeaderboard(leaderboard);
    System.out.println(totalPoints); 
     LOG.info("HomeController method creditPoints -end ");
     return new ResponseEntity(totalPoints,HttpStatus.OK);
    }
}
