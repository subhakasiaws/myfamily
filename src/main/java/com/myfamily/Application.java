package com.myfamily;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.myfamily.service.EmailSchedulerService;


/**
 * @author ChandraThulasi
 *
 */
@SpringBootApplication
@EnableScheduling
@ComponentScan("com.myfamily")
public class Application {

	private static final Logger LOG = LogManager.getLogger(EmailSchedulerService.class);
	
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        LOG.info("application started ");
    }
}
