//package com.cnpc.utils;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Properties;
//
//public class DBManager {
//
//    
//	
//	private static String url;
//	private static String driverClass;
//	private static String userName;
//	private static String password;
//	
//	static {
//		Properties pro = new Properties();
//		try{
//			pro.load(DBManager.class.getResourceAsStream("/db.properties"));
//			driverClass = pro.getProperty("jdbc.driverClassName");
//			url = pro.getProperty("jdbc.url");
//			userName = pro.getProperty("jdbc.username");
//			password = pro.getProperty("jdbc.password");
//			
//		}catch(IOException e){
//			e.printStackTrace();
//		}
//		
//	}
//	
//	/**
//	 * 获得数据库的连接
//	 * @return
//	 */
//	public static Connection getConnection(){
//		Connection conn = null;
//		try {
//			Class.forName(driverClass);
//			conn = DriverManager.getConnection(url, userName, password);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
//	
//	/**
//	 * 关闭数据库连接对象
//	 * @param conn
//	 */
//	public static void closeConn(Connection conn) {
//		try {
//			if (null != conn) {
//				conn.close();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	/**
//	 * 增加、删除、改
//	 * @param sql
//	 * @param params
//	 * @return
//	 * @throws SQLException
//	 */
//	public boolean updateByPreparedStatement(String sql, List<Object>params)throws SQLException{
//		boolean flag = false;
//		int result = -1;
//		PreparedStatement pstmt = null;
//		Connection conn =null;
//		
//		conn = getConnection();
//		pstmt = conn.prepareStatement(sql);
//		int index = 1;
//		if(params != null && !params.isEmpty()){
//			for(int i=0; i<params.size(); i++){
//				pstmt.setObject(index++, params.get(i));
//			}
//		}
//		result = pstmt.executeUpdate();
//		flag = result > 0 ? true : false;
//		return flag;
//	}
//	/**
//	 * 批处理 增删查改
//	 * @param sql
//	 * @param params
//	 * @return
//	 * @throws SQLException
//	 */
//	public boolean updateBatchByPreparedStatement(String sql, List<List<Object>> params) throws SQLException
//	{
//		boolean flag = true;
//		int[] result;
//		connection.setAutoCommit(false);
//		pstmt = connection.prepareStatement(sql);
//		if(params != null && !params.isEmpty())
//		{
//			for(int i = 0; i < params.size();i++)
//			{
//				for(int index=1; index<=params.get(i).size(); index++){
//					pstmt.setObject(index, params.get(i).get(index-1));
//				}
//				pstmt.addBatch();
//			}
//		}
//		result = pstmt.executeBatch();
//		connection.commit();
//		//check the result
//		for(int i = 0;i<result.length;i++)
//		{
//			if(result[i]<0)
//			{
//				flag = false;
//			}
//		}
//		return flag;
//	}
//	
//	/**
//	 * 查询单条记录
//	 * @param sql
//	 * @param params
//	 * @return
//	 * @throws SQLException
//	 */
//	public Map<String, Object> findSimpleResult(String sql, List<Object> params) throws SQLException{
//		Map<String, Object> map = new HashMap<String, Object>();
//		int index  = 1;
//		pstmt = connection.prepareStatement(sql);
//		if(params != null && !params.isEmpty()){
//			for(int i=0; i<params.size(); i++){
//				pstmt.setObject(index++, params.get(i));
//			}
//		}
//		resultSet = pstmt.executeQuery();//返回查询结果
//		ResultSetMetaData metaData = resultSet.getMetaData();
//		int col_len = metaData.getColumnCount();
//		while(resultSet.next()){
//			for(int i=0; i<col_len; i++ ){
//				String cols_name = metaData.getColumnName(i+1);
//				Object cols_value = resultSet.getObject(cols_name);
//				if(cols_value == null){
//					cols_value = "";
//				}
//				map.put(cols_name, cols_value);
//			}
//		}
//		return map;
//	}
//	
//	/**查询多条记录
//	 * @param sql
//	 * @param params
//	 * @return
//	 * @throws SQLException
//	 */
//	public List<Map<String, Object>> findModeResult(String sql, List<Object> params) throws SQLException{
//		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//		int index = 1;
//		pstmt = connection.prepareStatement(sql);
//		if(params != null && !params.isEmpty()){
//			for(int i = 0; i<params.size(); i++){
//				pstmt.setObject(index++, params.get(i));
//			}
//		}
//		resultSet = pstmt.executeQuery();
//		ResultSetMetaData metaData = resultSet.getMetaData();
//		int cols_len = metaData.getColumnCount();
//		while(resultSet.next()){
//			Map<String, Object> map = new HashMap<String, Object>();
//			for(int i=0; i<cols_len; i++){
//				String cols_name = metaData.getColumnName(i+1);
//				Object cols_value = resultSet.getObject(cols_name);
//				if(cols_value == null){
//					cols_value = "";
//				}
//				map.put(cols_name, cols_value);
//			}
//			list.add(map);
//		}
//
//		return list;
//	}
//	
//	/**
//	 * 释放数据库连接
//	 */
//	public void releaseConn(){
//		if(resultSet != null){
//			try{
//				resultSet.close();
//			}catch(SQLException e){
//				e.printStackTrace();
//			}
//		}
//	}
//	
//}
