package com.acitiontest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SessionActionJSTL {

		public String testSession(){
			List<Map<String, Object>> totalList = new ArrayList<>();
			Map<String, Object> map = new HashMap<>();
			map.put("姓名", "刘丙浩");
			map.put("年龄", 23);
			map.put("住址", "山东济南");
			map.put("电话", "15888888888");
			return null;
		}
	
}
