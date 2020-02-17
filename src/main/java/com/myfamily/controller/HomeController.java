package com.myfamily.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
    @RequestMapping("/login")
    public String loginWithLocale(){
        return "login";
    }
    
    @RequestMapping("/")
    public String login(){
        return "redirect:login?lang=te";
    }
    
    @RequestMapping(value="/home", method=RequestMethod.POST)
    public ModelAndView home(String name) {
    
    LOG.info("HomeController method home-started "+name);
     ModelAndView model = new ModelAndView();
     model.addObject("name", name);
     model.setViewName("home");
     LOG.info("HomeController method home -end ");
     return model;
    }
}
