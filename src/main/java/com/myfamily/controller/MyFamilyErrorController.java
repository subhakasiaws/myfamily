package com.myfamily.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyFamilyErrorController implements ErrorController {
    private static final String PATH = "/error";

    @Override
    public String getErrorPath() {
       return PATH;
    }

    @RequestMapping(value = PATH)
    public String error() {
        return "Something went wrong, click here to Login";
    }
}
