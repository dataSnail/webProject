package com.cnpc.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Utils {
	public static Map<String,String> areaNameMapId=new HashMap<String,String>(){
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		{
			put("市机关","0");
			put("王家庄油库","1");
			put("栖霞油库","2");
			put("玉带油库","3");
			put("市区","4");
			put("江宁","5");
			put("六合","6");
			put("浦口","7");
			put("高淳","8");
			put("溧水","9");
			put("发展基建部","10");
			put("非油品业务部","11");
			put("安全数质量部","12");

		}
	};
	
	public static Map<String,String> areaIdMapName=new HashMap<String,String>(){
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		{
			put("0","市机关");
			put("1","王家庄油库");
			put("2","栖霞油库");
			put("3","玉带油库");
			put("4","市区");
			put("5","江宁");
			put("6","六合");
			put("7","浦口");
			put("8","高淳");
			put("9","溧水");
			put("10","发展基建部");
			put("11","非油品业务部");
			put("12","安全数质量部");
		}
	};
	
	public static Map<String,String> equipCertiIdMapName = new HashMap<String,String>(){
		private static final long serialVersionUID = 1L;
		{
			put("0","灭火器");
			put("1","质量流量计");
			put("2","安全阀");
			put("3","压力表");
			put("4","可燃气体报警仪");
			put("5","车辆");
			put("6","手持可燃气体报警器");
			put("7","防雷防静电接地电阻");
			put("8","建筑消防设施");
			put("9","气瓶减压阀");
			put("10","油罐");
			put("11","泡沫液");
			put("12","污水处理协议");
			put("13","垃圾处理协议");
			put("14","特种装备");
			put("15","变压器");
			put("16","管线");
			put("17","超声波测厚仪");
			put("18","电工用具");
			put("19","危化证");
			put("20","职业卫生检测");
			put("21","安全应急预案备案");
			put("22","重大危险源备案");
			put("23","压力变送器");
			put("24","加气机");
			put("25","卸气机");
			put("26","储气井");
			put("100","成品油经营许可证");
			put("101","烟草证");
			put("102","食品经营许可证");
			put("103","从业人员健康证");
			put("104","油气回收检测");
		}
	};
	
	public static Map<String,String> equipCertiNameMapId = new HashMap<String,String>(){
		private static final long serialVersionUID = 1L;
		{
			put("灭火器","0");
			put("质量流量计","1");
			put("安全阀","2");
			put("压力表","3");
			put("可燃气体报警仪","4");
			put("车辆","5");
			put("手持可燃气体报警器","6");
			put("防雷防静电接地电阻","7");
			put("建筑消防设施","8");
			put("气瓶减压阀","9");
			put("油罐","10");
			put("泡沫液","11");
			put("污水处理协议","12");
			put("垃圾处理协议","13");
			put("特种装备","14");
			put("变压器","15");
			put("管线","16");
			put("超声波测厚仪","17");
			put("电工用具","18");
			put("危化证","19");
			put("职业卫生检测","20");
			put("安全应急预案备案","21");
			put("重大危险源备案","22");
			put("压力变送器","23");
			put("加气机","24");
			put("卸气机","25");
			put("储气井","26");
			put("成品油经营许可证","100");
			put("烟草证","101");
			put("食品经营许可证","102");
			put("从业人员健康证","103");
			put("油气回收检测","104");
		}
	};

	
	
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
//		if(s.indexOf("灭火器")!=-1)
//			return 0;
//		if(s.indexOf("流量计")!=-1)
//			return 1;
//		if(s.indexOf("安全阀")!=-1)
//			return 2;
//		if(s.indexOf("压力表")!=-1)
//			return 3;
//		if(s.indexOf("加气机")!=-1)
//			return 4;
//		if(s.indexOf("卸气柱")!=-1)
//			return 5;
//		if(s.indexOf("储气井")!=-1)
//			return 6;
//		if(s.indexOf("可燃气器报警")!=-1)
//			return 7;
		if (Utils.equipCertiNameMapId!=null)
		{
			String equipId = Utils.equipCertiNameMapId.get(s.trim());
			if(equipId!=null)
				return Integer.valueOf(equipId);
			return -1;
		}
		else
			return -1;
	}


	public static int getCType(String s)
	{
//		if(s.indexOf("成品油经营许可证")!=-1)
//			return 0;
//		if(s.indexOf("商务局批复")!=-1)
//			return 1;
//		if(s.indexOf("食品经营许可证")!=-1)
//			return 2;
//		if(s.indexOf("烟草证")!=-1)
//			return 3;
//		if(s.indexOf("从业人员健康证")!=-1)
//			return 4;
		if (Utils.equipCertiNameMapId!=null)
		{
			String equipId = Utils.equipCertiNameMapId.get(s.trim());
			if(equipId!=null)
				return Integer.valueOf(equipId);
			return -1;
		}
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
