package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.minihome.db.MyDBCP;

public class BasicSettingDao {
	private static BasicSettingDao instance = new BasicSettingDao();
	private BasicSettingDao() {};
	public static BasicSettingDao getInstance() {
		return instance;
	}
	public boolean checkbsset(int purnum) {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = MyDBCP.getConnection();
			String sql = "select glink from Basicsetting where purnum =? and bsset = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, purnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return false;
		
	}

}
