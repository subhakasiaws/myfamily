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
import com.myfamily.exception.MyFamilyException;
import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.UserBoard;
import com.myfamily.model.Users;
import com.myfamily.service.UserService;
 
/**
 * @author Chandra
 *
 */
@Controller
public class HomeController {

	private static final Logger LOG = LogManager.getLogger(HomeController.class);
	
	String month[]= {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	
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
	public ModelAndView home(String name, Integer userId) {

		LOG.info("home -start" + name);

		if (MyFamilyUtil.isBlankString(name)) {
			throw new MyFamilyException("Name is empty");
		}
		ModelAndView model = new ModelAndView();
		model.setViewName(MyFamilyConstants.HOME);

		if (userId == null) {
			Users user = new Users();
			user.setName(MyFamilyUtil.capitalize(name));
			Leaderboard leaderboard = new Leaderboard();
			leaderboard.setPoints(0);
			leaderboard.setUsers(user);
			List<Leaderboard> leaderList = userService.createBoard(leaderboard);
			model.addObject(MyFamilyConstants.LEADERBOARD, leaderList);
			UserBoard userBoard = MyFamilyUtil.getUserIdPoints(leaderList, name);
			model.addObject(MyFamilyConstants.USERBOARD, userBoard);
		} else {
			List<Leaderboard> userList = userService.findAll();
			model.addObject(MyFamilyConstants.LEADERBOARD, userList);
			UserBoard userBoard = MyFamilyUtil.getUserIdPoints(userList, name);
			model.addObject(MyFamilyConstants.USERBOARD,userBoard);
		}

		LOG.info("home -end ");
		return model;
	}
    
    @RequestMapping("/calendar")
    public ModelAndView calendar(){
    	LOG.info("calendar -start ");
    	 ModelAndView model = new ModelAndView();
    	 List<Event> eventList= userService.findAllEvents();
    	 LOG.info("eventList : "+eventList.size());
    	 model.addObject(MyFamilyConstants.EVENTS,eventList);
    	 model.setViewName("calendar");
    	 LOG.info("calendar -end ");
        return model;
    }
    
    @RequestMapping(value="/shopping", method= RequestMethod.GET)
    public String shopping(){
    	LOG.info("shopping-- start");
    	 LOG.info("shopping-- end");
        return "shopping";
    }
    
    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    public String Task(){
    	LOG.info("Task-- start");
    	LOG.info("Task-- end");
        return "task";
    }
    
    @RequestMapping(value = "/createEvent", method = RequestMethod.GET)
    public ResponseEntity<String> createEvent(@ModelAttribute(value="event") Event event){
    	LOG.info("createEvent-- start");
    	userService.saveEvent(event);
    	LOG.info("createEvent-- end");
        return new ResponseEntity<String>(MyFamilyConstants.SUCCESS,HttpStatus.OK);
    }
    
    @RequestMapping(value = "/dropEvent", method = RequestMethod.GET)
    public ResponseEntity<String> dropEvent(Integer eventId){
    	LOG.info("createEvent-- start");
    	userService.dropEvent(eventId);
    	LOG.info("createEvent-- end");
        return new ResponseEntity<String>(MyFamilyConstants.SUCCESS,HttpStatus.OK);
    }
    
    @RequestMapping("/board")
    public String Board(){
        return "board";
    }
    
    @RequestMapping(path="/creditPoints", method= RequestMethod.GET)
    public ResponseEntity<Integer> creditPoints(Integer userId, Integer points) {
    LOG.info("HomeController method creditPoints -start");
    Integer totalPoints = userService.updateLeaderboard(userId,points);
    System.out.println(totalPoints); 
     LOG.info("HomeController method creditPoints -end ");
     return new ResponseEntity<Integer>(totalPoints,HttpStatus.OK);
    }
}
