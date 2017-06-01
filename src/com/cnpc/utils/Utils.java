package com.cnpc.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		if(s.indexOf("灭火器")!=-1)
			return 0;
		if(s.indexOf("流量计")!=-1)
			return 1;
		if(s.indexOf("安全阀")!=-1)
			return 2;
		if(s.indexOf("压力表")!=-1)
			return 3;
		if(s.indexOf("加气机")!=-1)
			return 4;
		if(s.indexOf("卸气柱")!=-1)
			return 5;
		if(s.indexOf("储气井")!=-1)
			return 6;
		if(s.indexOf("可燃气器报警")!=-1)
			return 7;
		else
			return -1;
	}


	public static int getCType(String s)
	{
		if(s.indexOf("成品油经营许可证")!=-1)
			return 0;
		if(s.indexOf("商务局批复")!=-1)
			return 1;
		if(s.indexOf("食品经营许可证")!=-1)
			return 2;
		if(s.indexOf("烟草证")!=-1)
			return 3;
		if(s.indexOf("从业人员健康证")!=-1)
			return 4;
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
	public static List<ArrayList<Object>> convertCParams(List<List<Object>> params)
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
					type = getCType((String)params.get(i).get(1));
					area = (String)params.get(i).get(3);
					skipLine = i+1;
					continue;
				}
				if(i==skipLine) continue;//类型下面必带表头，跳过
				
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
	
	public static final Map<String,String> priorityMap = new HashMap<String,String>(){
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		{
		put("0","equip/query.do");
		put("1","certif/query.do");
		put("2","outdate/query.do");
		put("3","up/uploadfile.do");
		put("4","user");
		}
	};
	
	public static boolean checkNull(String s)
	{
		if(s==null||"".equals(s.trim())||s.length()==0)
			return true;
		return false;
	}
	
	
}
