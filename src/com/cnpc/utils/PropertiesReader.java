package com.cnpc.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PropertiesReader {
	
	public static String getProperty(String s)
	{
		String result = null;
		Properties prop = new Properties();
		String propsPath = PropertiesReader.class.getClassLoader().getResource("").getPath()+"config.properties";
		//propsPath = propsPath.substring(1);
		System.out.println("=0="+propsPath+"==");
		try {
			FileInputStream in = new FileInputStream(propsPath);
			prop.load(in);
			result = prop.getProperty("dbip");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//test
	public static void main(String[] args)
	{
		System.out.println(getProperty("dbip"));
	}
	
}
