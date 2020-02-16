package com.myfamily.config;

import java.util.concurrent.TimeUnit;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan("com.myfamily.controller")
public class MvcConfiguration implements WebMvcConfigurer{
	
    @Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		registry.viewResolver(resolver);
	}
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
      registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
      registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
      registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
      registry.addResourceHandler("/resources/**").addResourceLocations("/statics/")
      .setCacheControl(CacheControl.maxAge(2, TimeUnit.HOURS).cachePublic());
    }
    @Bean("messageSource")
    public MessageSource messageSource() {
       ReloadableResourceBundleMessageSource messageSource=new ReloadableResourceBundleMessageSource();
       messageSource.setBasename("classpath:locale/messages");
       messageSource.setDefaultEncoding("UTF-8");
       messageSource.setUseCodeAsDefaultMessage(true);
       return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
       CookieLocaleResolver localeResolver = new CookieLocaleResolver();
       return localeResolver;
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
       LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
       localeChangeInterceptor.setParamName("lang");
       registry.addInterceptor(localeChangeInterceptor);
    }
}
