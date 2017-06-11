package com.cnpc.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.UploadFileDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class UploadFileAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String type="";
	private String result;
	private String fileType;
	private File myFile;
	private UploadFileDao uploadDao = (UploadFileDao) SpringInit.getApplicationContext().getBean("uploadDao");

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	//fileName=1.xls&fileType=equipment
	public String uploadFile() throws FileNotFoundException
	{
		String uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
		System.out.println("type:"+type);
		if (myFile==null)
		{
			return SUCCESS;
		}else if(myFile.isFile()){
		try {
			InputStream is=new FileInputStream(this.getMyFile());
//				//设置目标文件
			File toFile=new File(uploadPath, "temp.xls");
//				//设置输出流
			OutputStream os=new FileOutputStream(toFile);
//				//设置缓存
			byte[] buffer=new byte[1024];
			int length=0;
//				//读取file文件到toFile
			while ((length=is.read(buffer))!=-1) {
				os.write(buffer,0,length);
			}
			is.close();
			os.close();
		System.out.println(fileType);
		if("equipment".equals(fileType))
		{
			if(uploadDao.readExcel2DBC(uploadPath+"\\temp.xls",0))
			{
				result = "导入设备信息文件成功！";
			}else{
				result = "导入设备信息失败！";
			}
		}else if("certification".equals(fileType)){
			if(uploadDao.readExcel2DB(uploadPath+"\\temp.xls",1))
			{
				result = "导入证件信息文件成功！";
			}else{
				result = "导入证件信息失败！";
			}
		}else{
			result = "未找到正确的导入类别！";
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else{
			return ERROR;
		}
		
		return SUCCESS;
	} 
}
