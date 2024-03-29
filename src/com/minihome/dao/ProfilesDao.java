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
				String porgimg = rs.getString(2);
				String psaveimg = rs.getString(3);
				String ptitle = rs.getString(4);
				String htitle = rs.getString(5);
				String pintro = rs.getString(6);
				int popen = rs.getInt(7);

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
											   rs.getString("htitle"), 
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
				ProfilesVo vo = new ProfilesVo(rs.getString(1),
												rs.getString(2), 
												rs.getString(3), 
												rs.getString(4),
												rs.getString(5),
												rs.getString(6),
												rs.getInt(7));
				
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
	public int update(ProfilesVo vo) {
		String sql ="update profiles set porgimg=?,psaveimg=?,ptitle=?, htitle=?,pintro=?,popen=? where id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPorgimg());
			pstmt.setString(2, vo.getPsavegimg());
			pstmt.setString(3, vo.getPtitle());
			pstmt.setString(4, vo.getHtitle());
			pstmt.setString(5, vo.getPintro());
			pstmt.setInt(6, vo.getPopen());
			pstmt.setString(7, vo.getId());
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException se) {
			se.printStackTrace();
			// TODO: handle exception
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	
	}
	
	public int fileupdate(String id) {	
		String sql = "update profiles set porgimg=null, psaveimg=null where id= ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			int n = pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
		
		
		
	}
	
	
	
	
	
	public int delete(String id) {
		String sql = "delete from profiles where id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			int n = pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
		return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
			
		}
	}
	
}
