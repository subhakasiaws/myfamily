package com.myfamily.exception;

public class MyFamilyException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5546971011954088459L;
	private String message;
	
	public MyFamilyException(String msg) {
		this.message=msg;
	}
	
}
