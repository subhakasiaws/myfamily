package com.myfamily.config;

import java.util.List;

import com.myfamily.model.Leaderboard;

public class MyFamilyUtil {

	public static Leaderboard getCurrentUser(List<Leaderboard> userList, String name) {
		Leaderboard ll= null;
        for (Leaderboard temp : userList) {
            if (name.equals(temp.getName())) {
                ll = temp;
            }
        }
		return ll;
	}
}
