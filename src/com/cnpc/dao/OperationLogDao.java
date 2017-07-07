package com.cnpc.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class OperationLogDao extends JdbcDaoSupport{
	public int insertLog(final Object[] obj){
		String sql = "insert into operationLog(username,operation,object,op_time) values (?,?,?,now())";
		
		this.getJdbcTemplate().update(sql, new PreparedStatementSetter(){
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, obj[0]+"");
				ps.setString(2, obj[1]+"");
				ps.setString(3, obj[2]+"");
			}
		});
		return 0;
	}
}
