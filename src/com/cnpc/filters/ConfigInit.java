package com.cnpc.filters;

import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.cnpc.dao.UserDao;

public class ConfigInit implements ServletContextListener{

	public static Map<String,String> areaIdMapName;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("初始化区域列表，设备证书列表");
//		areaIdMapName = 
		userDao.initAreaID();
	}
	
	

}
