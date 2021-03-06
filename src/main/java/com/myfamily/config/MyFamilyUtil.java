package com.myfamily.config;

import java.util.List;

import com.myfamily.model.Leaderboard;
import com.myfamily.model.UserBoard;

public class MyFamilyUtil {

	public static boolean isBlankString(String string) {
	    return string == null || string.trim().isEmpty();
	}

	public static UserBoard getUserIdPoints(List<Leaderboard> userList, String name) {
		UserBoard userBoard= new UserBoard();
        for (Leaderboard temp : userList) {
            if (name.equalsIgnoreCase(temp.getUsers().getName())) {
            	userBoard.setPoints(temp.getPoints());
            	userBoard.setUserId(temp.getUsers().getUserId());
            	userBoard.setUserName(capitalize(name));
            }
        }
		return userBoard;
	}
	
	public static String capitalize(String str) {
	    if(str == null || str.isEmpty()) {
	        return str;
	    }

	    return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
}
