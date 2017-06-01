package com.cnpc.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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

public class ExcelReader {
	
	 public List<List<Object>> readExcel2DB(File file)
	 {
		 List<List<Object>> resultLs = new ArrayList<List<Object>>();
		 int count;
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
	         System.out.println(lastRowIndex);
	         for(int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex ++){
	             Row row = sheet.getRow(rIndex); 
	             if(row != null){
	            	 List<Object> params = new ArrayList<Object>();
	                 int firstCellIndex = row.getFirstCellNum();
	                 int lastCellIndex = row.getLastCellNum();
	                 System.out.print("("+firstCellIndex+","+lastCellIndex+")");
	                 if (lastCellIndex-firstCellIndex!=10&&lastCellIndex-firstCellIndex!=4)
	                 {
	                	 System.out.println("数据列数不符合！");
	                	 break;
	                 }
	                 count = 0;
	                 for(int i = firstCellIndex;i<lastCellIndex;i++){
	                     Cell cell = row.getCell(i);
	                     switch(cell.getCellType())
	                     {
	                     	case Cell.CELL_TYPE_STRING:
	                     		System.out.print(cell.getRichStringCellValue().getString()+"|||");
	                     		if(Utils.checkNull(cell.getRichStringCellValue().getString())) count++;
	                     		params.add(cell.getRichStringCellValue().getString());
	                     		break;
	                     	case Cell.CELL_TYPE_NUMERIC:
	                     		if(Utils.checkNull(cell.getNumericCellValue()+"")) count++;
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
	                     		if(Utils.checkNull(cell.getRichStringCellValue().getString())) count++;
	                     		params.add(cell.getRichStringCellValue().getString());
	                     		break;
	                     }
	                 }
	                 System.out.println('\n');
	                 if(count<9)
	                	 resultLs.add(params);
	                 else{
	                	 System.out.println("空行");
	                 }
	             }
	             
	         }
	     } catch (Exception e) {
	         e.printStackTrace();  
	     }
		 return resultLs;
	 }


	 public List<List<Object>> readExcel2DBC(File file)
	 {
		 List<List<Object>> resultLs = new ArrayList<List<Object>>();
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
	         System.out.println(lastRowIndex);
	         for(int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex ++){
	             Row row = sheet.getRow(rIndex); 
	             if(row != null){
	            	 List<Object> params = new ArrayList<Object>();
	                 int firstCellIndex = row.getFirstCellNum();
	                 int lastCellIndex = row.getLastCellNum();
	                 System.out.print("("+firstCellIndex+","+lastCellIndex+")");
	                 if (lastCellIndex-firstCellIndex!=10)
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
	                 resultLs.add(params);
	             }
	             
	         }
	     } catch (Exception e) {
	         e.printStackTrace();  
	     }
		 return resultLs;
	 }
	 
	 public static void main(String [] args)
	 {
		 ExcelReader er = new ExcelReader();
		 File f = new File("E:\\project1\\info.xls");
		 er.readExcel2DB(f);
	 }
}
