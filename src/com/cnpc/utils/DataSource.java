package com.cnpc.utils;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class DataSource {
	private static ApplicationContext ac = null;
	private static ProxoolDataSource template = null;
	
	private DataSource(){
		if (ac ==null)
			ac = new FileSystemXmlApplicationContext("src/applicationContext.xml"); 
	}
	
	
	
	public static ProxoolDataSource getDataSource(String datasourceName)
	{
		template = (ProxoolDataSource) ac.getBean(datasourceName);
		return template;
	}
}
