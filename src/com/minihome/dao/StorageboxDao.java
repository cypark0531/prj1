package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.minihome.db.MyDBCP;
import com.minihome.vo.StorageboxVo;

public class StorageboxDao {
	private static StorageboxDao instance = new StorageboxDao();
	private StorageboxDao() {};
	public static StorageboxDao getInstance() {
		return instance;
	}
	public int storageinsert(StorageboxVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into storagebox values(storagebox_seq.nextval,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGcode());
			pstmt.setString(3, vo.getGlink());
			pstmt.setString(4, vo.getGsaveimg());
			pstmt.setString(5, vo.getGorgimg());
			pstmt.setString(6, vo.getGname());
			pstmt.setString(7, vo.getGcategory());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	//보관함 페이징
	public ArrayList<StorageboxVo> storagelist(int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from "
					+ "("
					+ "select storagebox.*,rownum rnum from"
					+  "("
					+   "select * from storagebox order by anum desc"
					+ ")storagebox"
					+ "  )where rnum>=? and rnum<=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<StorageboxVo> slist = new ArrayList<StorageboxVo>();
			while(rs.next()) {
				StorageboxVo vo=new StorageboxVo(
						rs.getInt("anum"),
						rs.getString("id"),
						rs.getString("gcode"), 
						rs.getString("glink"),
						rs.getString("gsaveimg"),
						rs.getString("gorgimg"),
						rs.getString("gname"),
						rs.getString("gcategory"));
				slist.add(vo);
			}
			return slist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int getCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select NVL(count(*),0) from storagebox";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int mnum=rs.getInt(1);
				return mnum;
			}
			return -1;
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	//카테고리
	public ArrayList<StorageboxVo> sclist(String gcategory, int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from "
					+ "("
					+ "select storagebox.*,rownum rnum from "
					+  "("
					+   "select * from storagebox where gcategory=? order by anum desc"
					+ ")storagebox"
					+ "  )where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gcategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<StorageboxVo> sclist = new ArrayList<StorageboxVo>();
			while(rs.next()) {
				StorageboxVo vo=new StorageboxVo(
						rs.getInt("anum"), 
						rs.getString("id"),
						rs.getString("gcode"),
						rs.getString("glink"), 
						rs.getString("gsaveimg"), 
						rs.getString("gorgimg"), 
						rs.getString("gname"), 
						rs.getString("gcategory"));
				sclist.add(vo);
			}
			return sclist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	//카테고리 페이징
	public int getCount1(String gcategory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select NVL(count(*),0) from storagebox where gcategory=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gcategory);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int mnum=rs.getInt(1);
				return mnum;
			}
			return -1;
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
}
