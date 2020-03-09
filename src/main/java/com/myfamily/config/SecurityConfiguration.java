package com.myfamily.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration 
@EnableWebSecurity 
public class SecurityConfiguration extends WebSecurityConfigurerAdapter { 
 
	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/fonts/*")
        .antMatchers("/resources/**");
    }
  @Override 
  protected void configure(HttpSecurity http) throws Exception {   
	  http.csrf().disable()
	  .authorizeRequests() 
        .antMatchers("/*").permitAll()
        .antMatchers("/*/*").permitAll()
        .antMatchers(HttpMethod.POST,"/home").permitAll()
        .antMatchers("/login").permitAll(); 
  } 
}
