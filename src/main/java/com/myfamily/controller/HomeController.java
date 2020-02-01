package com.myfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
/**
 * @author ChandraThulasi
 *
 */
@Controller
public class HomeController {

    @RequestMapping("/")
    public String viewHome() {
        return "index";
    }
    
    @RequestMapping("/hello")
    public String customerDataAngularJS() {
        return "hello";
    }
}
