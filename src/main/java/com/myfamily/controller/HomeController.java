package com.myfamily.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
/**
 * @author ChandraThulasi
 *
 */
@Controller
public class HomeController {

	private static final Logger LOG = LogManager.getLogger(HomeController.class);
	
	@GetMapping("/greeting")
	public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}
	
    @RequestMapping("/welcome")
    public String loginMessage(){
        return "welcome";
    }
    
    @RequestMapping("/")
    public String login(){
        return "login";
    }
    
    @RequestMapping(value="/home", method=RequestMethod.POST)
    public ModelAndView home(Object name) {
    
    LOG.info("HomeController method home-started "+name);
     ModelAndView model = new ModelAndView();
     model.setViewName("home");
     LOG.info("HomeController method home -end ");
     return model;
    }
}
