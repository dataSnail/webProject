package com.cnpc.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cnpc.dao.EquipInfoDao;
import com.cnpc.dao.UploadFileDao;
import com.cnpc.filters.SpringInit;
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
//	private EquipInfoDao equipDao = (EquipInfoDao) SpringInit.getApplicationContext().getBean("equipDao");

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
		HttpServletRequest request = ServletActionContext.getRequest();
		String user_area_id = (String) request.getSession().getAttribute("area_id");
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
			if(uploadDao.readExcel2DBC(uploadPath+"\\temp.xls",0,user_area_id))
			{
				result = "导入设备信息文件成功！";
			}else{
				result = "导入设备信息失败！";
			}
		}else if("certification".equals(fileType)){
			if(uploadDao.readExcel2DB(uploadPath+"\\temp.xls",1,user_area_id))
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
	
	
//	public void downloadFile(){
//		HttpServletResponse response = ServletActionContext.getResponse();
//		String type = "1";
//		try {
//			response.setContentType("octets/stream");    
//			String nowdate = "_equipment";//DateUtils.getNow().substring(0,8);
//			response.addHeader("Content-Disposition","attachment;filename=outfile"+nowdate+".xls");    
//			OutputStream out = response.getOutputStream();    
//			ExcelWrite<HashMap> exportexcel = new ExcelWrite<HashMap>();  
//			if("0".equals(type)){
//				List<Map<String, Object>> dataset= equipDao.getEquipInfoMap("市机关",type,1);
//				String[] headers2 = { "地区", "部门", "房间", "规格", "标签","地点", "过期日期", "负责部门", "负责人", "负责执行人","备注"};  
//				String[] keys = {"area","department","room","specification","label","location","exp_date","responsible_dep","responsible_person","person_pic","notes"};    
//				exportexcel.exportExcelList( "导出设备信息",headers2, dataset , out,keys);
//			}else if("1".equals(type)){
//				List<Map<String, Object>> dataset= equipDao.getEquipInfoMap("市机关",type,1);
//				String[] headers2 = { "地区", "部门", "房间", "规格", "标签","地点", "过期日期", "负责部门", "负责人", "负责执行人","备注"};  
//				String[] keys = {"area","department","room","specification","label","location","exp_date","responsible_dep","responsible_person","person_pic","notes"};    
//				exportexcel.exportExcelList( "导出证书信息",headers2,dataset,out,keys);
//			}
//		    out.close();    
//	    }catch (Exception e) {
//	        e.printStackTrace();    
//	    }
//	}
	
}
