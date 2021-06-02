package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.ProfilesVo;

public class ProfilesDao {
	private static ProfilesDao instance = new ProfilesDao();

	private ProfilesDao() {
	}

	public static ProfilesDao getInstance() {
		return instance;
	}

	public int insert(ProfilesVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into profiles values(?,?,?,?,?,?,?)";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			/*
			 *
			 * private String id; private String porgimg; private String psavegimg; private
			 * String ptitle; private String hptitle; private String pintro; private int
			 * popen;
			 */
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPorgimg());
			pstmt.setString(3, vo.getPsavegimg());
			pstmt.setString(4, vo.getPtitle());
			pstmt.setString(5, vo.getHtitle());
			pstmt.setString(6, vo.getPintro());
			pstmt.setString(6, vo.getPintro());
			pstmt.setInt(7, vo.getPopen());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			// TODO: handle exception
			se.printStackTrace();
			return -1;
		} finally {
			MyDBCP.close(con, pstmt, null);
		}

	}

	public ArrayList<ProfilesVo> list(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from profiles where id =?";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			ArrayList<ProfilesVo> list = new ArrayList<>();
			while (rs.next()) {
				/*
				 * private String id; private String porgimg; private String psavegimg; private
				 * String ptitle; private String hptitle; private String pintro; private int
				 * popen;
				 */
				//String id1 = rs.getString("id");
				String porgimg = rs.getString("porgimg");
				String psaveimg = rs.getString("psaveimg");
				String ptitle = rs.getString("ptitle");
				String htitle = rs.getString("htitle");
				String pintro = rs.getString("pintro");
				int popen = rs.getInt("popen");

				ProfilesVo vo = new ProfilesVo(id, porgimg, psaveimg, ptitle, htitle, pintro, popen);
				list.add(vo);
			}
			return list;

		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			MyDBCP.close(con, pstmt, rs);
		}

	}
	public ProfilesVo getinfoVo(String id) {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from profiles where id =?";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				/*
				 * private String id; 
				 * private String porgimg; 
				 * private String psavegimg; 
				 * private String ptitle; 
				 * private String hptitle; 
				 * private String pintro; 
				 * private int popen;
				 */
				ProfilesVo vo = new ProfilesVo(rs.getString("id"),
											   rs.getString("porgimg"),
											   rs.getString("psaveimg"), 
											   rs.getString("ptitle"), 
											   rs.getString("hptitle"), 
											   rs.getString("pintro"),
											   rs.getInt("popen"));
									return vo;
								}
			
							
		} catch (SQLException se) {
			se.printStackTrace();
			// TODO: handle exception
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return null;
	}
	public ArrayList<ProfilesVo> list() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from profiles";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<ProfilesVo> list = new ArrayList<>();
			while (rs.next()) {
				ProfilesVo vo = new ProfilesVo(rs.getString("id"),
												rs.getString("porgimg"), 
												rs.getString("psaveimg"), 
												rs.getString("ptitle"),
												rs.getString("htitle"),
												rs.getString("pintro"),
												rs.getInt("popen"));
				
				list.add(vo);
			}
			return list;			
		} catch (SQLException e) {
			 e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
}
