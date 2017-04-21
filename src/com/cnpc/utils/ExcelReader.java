package com.cnpc.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class ExcelReader {
	ApplicationContext ac = new FileSystemXmlApplicationContext("src/applicationContext.xml"); 
	ProxoolDataSource template = (ProxoolDataSource) ac.getBean("dataSource");
	Connection conn = null;
	Statement stmt = null;
//	ResultSet res = stmt.executeQuery("select * from equipments");
//	while(res.next()){
//		String  a = res.getString("id");
//		System.out.println(a);
//	}
//	stmt.close();
//	conn.close();
	
	
	
	 public boolean readExcel2DB(File file)
	 {
		 boolean result =false;
		 
		try {
			conn = template.getConnection();
			stmt = conn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 
		 try{
			 InputStream inputStream = new FileInputStream(file);
	         String fileName = file.getName();  
	         Workbook wb = null;  
	         if(fileName.endsWith("xls")){  
	             wb = new HSSFWorkbook(inputStream);//解析xls格式  
	         }else if(fileName.endsWith("xlsx")){  
	             wb = new XSSFWorkbook(inputStream);//解析xlsx格式  
	         }
	         DecimalFormat df = new DecimalFormat("0");
	         Sheet sheet = wb.getSheetAt(0);//第一个工作表 
	         int firstRowIndex = sheet.getFirstRowNum();  
	         int lastRowIndex = sheet.getLastRowNum();
	         for(int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex ++){
	             Row row = sheet.getRow(rIndex); 
	             if(row != null){
	            	 List<Object> params = new ArrayList<Object>();
	                 int firstCellIndex = row.getFirstCellNum();
	                 int lastCellIndex = row.getLastCellNum();
	                 System.out.print("("+firstCellIndex+","+lastCellIndex+")");
	                 if (lastCellIndex-firstCellIndex!=9)
	                 {
	                	 System.out.println("数据列数不符合！");
	                	 break;
	                 }
	                 for(int i = firstCellIndex;i<lastCellIndex;i++){
	                     Cell cell = row.getCell(i);
	                     switch(cell.getCellType())
	                     {
	                     	case Cell.CELL_TYPE_STRING:
	                     		System.out.print(cell.getRichStringCellValue().getString()+"|||");
	                     		params.add(cell.getRichStringCellValue().getString());
	                     		break;
	                     	case Cell.CELL_TYPE_NUMERIC:
	                     		if(HSSFDateUtil.isCellDateFormatted(cell))
	                     		{
	                     			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		                     		System.out.print(sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()))+"|||");
		                     		params.add(sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString());
	                     		}else
	                     		{
		                     		System.out.print(df.format(cell.getNumericCellValue())+"|||");
		                     		params.add(df.format(cell.getNumericCellValue()));
	                     		}
	                     		break;
	                     	default:
	                     		System.out.print(cell.getStringCellValue()+"|-|");
	                     		params.add(cell.getRichStringCellValue().getString());
	                     		break;
	                     }
	                 }
	                 System.out.println('\n');
	             }
	             
	         }
	     } catch (Exception e) {
	         e.printStackTrace();  
	     }finally{
			try {
				if(stmt!=null)
					stmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	 
	     }
		 
		 return result;
	 }
	 
	 public static void main(String [] args)
	 {
		 ExcelReader er = new ExcelReader();
		 File f = new File("E:\\project1\\info.xls");
		 er.readExcel2DB(f);
	 }
	 
}
