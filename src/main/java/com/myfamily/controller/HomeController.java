package com.myfamily.controller;

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

	@GetMapping("/greeting")
	public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}
	
    @RequestMapping("/welcome")
    public String loginMessage(){
        return "welcome";
    }
    
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    public ModelAndView home() {
     ModelAndView model = new ModelAndView();
     model.setViewName("home");
     return model;
    }
}
