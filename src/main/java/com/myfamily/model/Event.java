package com.myfamily.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="EVENTS")
public class Event {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column
	private String eventName;
	@Column
	private String eventDescription;
	@Column
	private Integer eventDay;
	@Column
	private Integer eventMonth;
	@Column
	private String stringMonth;
	@Column
	private String eventCreatedBy;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getEventCreatedBy() {
		return eventCreatedBy;
	}
	public void setEventCreatedBy(String eventCreatedBy) {
		this.eventCreatedBy = eventCreatedBy;
	}
	public Integer getEventDay() {
		return eventDay;
	}
	public void setEventDay(Integer eventDay) {
		this.eventDay = eventDay;
	}
	public Integer getEventMonth() {
		return eventMonth;
	}
	public void setEventMonth(Integer eventMonth) {
		this.eventMonth = eventMonth;
	}
	public String getStringMonth() {
		return stringMonth;
	}
	public void setStringMonth(String stringMonth) {
		this.stringMonth = stringMonth;
	}

	
}
