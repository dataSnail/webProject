package com.cnpc.utils;

import java.util.ArrayList;
import java.util.List;

public class Utils {
	
	public static boolean isNumeric(String str){
		for(int i=str.length();--i>=0;){
		      int chr=str.charAt(i);
		      if(chr<48 || chr>57)
		         return false;
		   }
		   return true;
	}
	
	
	
	public static int getType(String s)
	{
		if(s.equals("灭火器"))
			return 0;
		if(s.equals("流量计"))
			return 1;
		if(s.equals("安全阀"))
			return 2;
		if(s.equals("压力表"))
			return 3;
		if(s.equals("加气机"))
			return 4;
		if(s.equals("卸气柱"))
			return 5;
		if(s.equals("储气井"))
			return 6;
		if(s.equals("可燃气器报警"))
			return 7;
		else
			return -1;
	}
	
	public static List<ArrayList<Object>> convertParams(List<List<Object>> params)
	{
		int type = -1;
		String area = "";
		int skipLine = -1;
		String lastDepartment = "";
		
		List<ArrayList<Object>> llo = new ArrayList<ArrayList<Object>>();
		if(params!=null&&!params.isEmpty())
		{
			for (int i =0;i<params.size();i++)
			{
				ArrayList<Object> ao = new ArrayList<Object>();
				if(params.get(i).get(0).equals("类型"))
				{
					type = getType((String)params.get(i).get(1));
					area = (String)params.get(i).get(3);
					skipLine = i+1;
					continue;
				}
				if(i==skipLine) continue;
				
				ao.add(type);
				ao.add(area);
				if(params.get(i).get(0).equals("")&&!lastDepartment.equals(""))
				{
					//TODO return false;
				}else{
					lastDepartment = (String)params.get(i).get(0);
//								pstmt.setObject(2, lastDepartment);
				}
				ao.add(lastDepartment);
				for(int index = 4;index<=params.get(i).size()+2;index++)
				{
					ao.add(params.get(i).get(index-3));
					System.out.println(index+""+params.get(i).get(index-3));
				}
				llo.add(ao);
			}
		}
		
		return llo;
	}
	
	public static boolean checkNull(String s)
	{
		if(s==null||"".equals(s)||s.length()==0)
			return true;
		return false;
	}
	
	
}
