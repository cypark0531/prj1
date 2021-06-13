package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BasicsettingVo;


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
			String sql = "select glink from Basicsetting where purnum = ? and bsset = 1";
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
	public int basicinsert(BasicsettingVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into Basicsetting values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getBsnum());
			pstmt.setString(2, vo.getBscategory());
			pstmt.setInt(3, vo.getBsset());
			pstmt.setString(4, vo.getId());
			pstmt.setInt(5, vo.getPurnum());
			pstmt.setString(6, vo.getGlink());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}

}
