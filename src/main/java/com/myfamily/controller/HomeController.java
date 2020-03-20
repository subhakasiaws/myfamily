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

import com.myfamily.config.MyFamilyConstants;
import com.myfamily.config.MyFamilyUtil;
import com.myfamily.model.Event;
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
     model.addObject(MyFamilyConstants.USERID, userId);
     model.addObject(MyFamilyConstants.NAME, name);
     model.setViewName(MyFamilyConstants.HOME);

     if(isFromLogin) {
     	User user = new User();
         user.setName(name);
        Integer id = userService.addUser(user);
         model.addObject(MyFamilyConstants.NAME, name);
         Leaderboard ll = new Leaderboard();
         ll.setName(name);
         ll.setPoints(0);
         ll.setUserId(id);
         
         Leaderboard leaderboard = userService.creaditPoints(ll);
         
         model.addObject(MyFamilyConstants.USERID, leaderboard.getId());
         List<Leaderboard> userList= userService.findAll();
         model.addObject(MyFamilyConstants.USERS,userList);
         model.addObject(MyFamilyConstants.POINTS,leaderboard.getPoints());
         model.addObject(MyFamilyConstants.IS_FORM_LOGIN,true);
     }else {
         List<Leaderboard> userList= userService.findAll();
         model.addObject(MyFamilyConstants.USERS,userList);
         Leaderboard ll = MyFamilyUtil.getCurrentUser(userList,name);
         model.addObject(MyFamilyConstants.POINTS,ll.getPoints());
         model.addObject(MyFamilyConstants.IS_FORM_LOGIN,false);
     }
     
     LOG.info("HomeController method home -end ");
     return model;
    }
    
    @RequestMapping("/calendar")
    public ModelAndView Calendar(){
    	 ModelAndView model = new ModelAndView();
    	 List<Event> eventList= userService.findAllEvents();
    	 LOG.info("eventList : "+eventList.size());
    	 model.addObject("events",eventList);
    	 model.setViewName("calendar");
        return model;
    }
    
    @RequestMapping("/shopping")
    public String shopping(){
        return "shopping";
    }
    
    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    public String Task(){
        return "task";
    }
    
    @RequestMapping(value = "/createEvent", method = RequestMethod.GET)
    public String createEvent(@ModelAttribute(value="event") Event event){
    	userService.saveEvent(event);
        return "success";
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
