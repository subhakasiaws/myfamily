package com.myfamily.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class EmailSchedulerService {
	
	private static final Logger LOG = LogManager.getLogger(EmailSchedulerService.class);

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

//	@Scheduled(fixedRate = 5000)
	public void sendEmail() {
		String fetivalName = getTeluguFestival();
		LOG.info("The time is now {}"+ dateFormat.format(new Date()));
		LOG.info(fetivalName);
	}

	private String getTeluguFestival() {
	
		return "";
	}
}
