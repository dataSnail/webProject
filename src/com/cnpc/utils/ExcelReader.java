package com.cnpc.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.sql.ResultSet;
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

	 public boolean readExcelAndWriteTxt(File file)
	 {
		 boolean result =false;
		 BufferedWriter fout = null;
		 try{
			 InputStream inputStream = new FileInputStream(file);
			 
	         String fileName = file.getName();  
	         Workbook wb = null;  
	         if(fileName.endsWith("xls")){  
	             wb = new HSSFWorkbook(inputStream);//解析xls格式  
	         }else if(fileName.endsWith("xlsx")){  
	             wb = new XSSFWorkbook(inputStream);//解析xlsx格式  
	         }  
	         Sheet sheet = wb.getSheetAt(0);//第一个工作表  
	         DecimalFormat df = new DecimalFormat("0");
	         
	         int firstRowIndex = sheet.getFirstRowNum();  
	         int lastRowIndex = sheet.getLastRowNum();
	         for(int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex ++){
	             Row row = sheet.getRow(rIndex);  
  
	         }
	     } catch (Exception e) {
	         e.printStackTrace();  
	     }finally{
	    	 try{
	    		 fout.close(); 
	    	 }catch(Exception e){
	    		 e.printStackTrace();
	    	 }
	     }
		 
		 return result;
	 }
	 
	 public static void main(String [] args)
	 {
		 
	 }
	 
}
