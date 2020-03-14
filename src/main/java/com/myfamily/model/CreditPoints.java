package com.myfamily.model;

public class CreditPoints {

	private String name;
	private Integer points;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPoints() {
		return points;
	}
	public void setPoints(Integer points) {
		this.points = points;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CreditPoints [name=");
		builder.append(name);
		builder.append(", points=");
		builder.append(points);
		builder.append("]");
		return builder.toString();
	}
	
}
