package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

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
			String sql="insert into storagebox values(storagebox_seq.nextval,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGcode());
			pstmt.setString(3, vo.getGlink());
			pstmt.setString(4, vo.getGsaveimg());
			pstmt.setString(5, vo.getGorgimg());
			pstmt.setString(6, vo.getGname());
			pstmt.setInt(7, vo.getPurnum());
			pstmt.setString(8, vo.getGcategory());
			pstmt.setInt(9, vo.getBasicsetting());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int storageboxdel(int purnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="delete from storagebox where purnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, purnum);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	
	//보관함 페이징
	public ArrayList<StorageboxVo> storagelist(String id, int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from "
					+ "("
					+ "select storagebox.*,rownum rnum from"
					+  "("
					+   "select * from storagebox where id=? order by anum desc"
					+ ")storagebox"
					+ "  )where rnum>=? and rnum<=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
						rs.getInt("purnum"),
						rs.getString("gcategory"),
						rs.getInt("basicsetting")
						);
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
	public ArrayList<StorageboxVo> storagelist(String id ,String gcategory){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from storagebox where id= ? and gcategory = ?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(1, gcategory);
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
						rs.getInt("purnum"),
						rs.getString("gcategory"),
						rs.getInt("basicsetting")
						);
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
	public ArrayList<StorageboxVo> sclist(String id, String gcategory, int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from "
					+ "("
					+ "select storagebox.*,rownum rnum from "
					+  "("
					+   "select * from storagebox where id=? and gcategory=? order by anum desc"
					+ ")storagebox"
					+ "  )where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gcategory);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
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
						rs.getInt("purnum"),
						rs.getString("gcategory"),
						rs.getInt("basicsetting"));
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
	public int update1(int anum, String gcategory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=MyDBCP.getConnection();
			String sql="update storagebox set basicsetting=0 where anum != ? and gcategory=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			pstmt.setString(2, gcategory);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int update2(int anum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=MyDBCP.getConnection();
			String sql="update storagebox set basicsetting=1 where anum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public StorageboxVo findback() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=MyDBCP.getConnection();
			String sql="select * from storagebox where basicsetting=1 and gcategory='background'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				StorageboxVo glist= new StorageboxVo(0, 
						rs.getString("id"), 
						rs.getString("gcode"), 
						rs.getString("glink"), 
						rs.getString("gsaveimg"),
						rs.getString("gorgimg"), 
						rs.getString("gname"), 
						rs.getInt("purnum"),
						rs.getString("gcategory"), 
						rs.getInt("basicsetting"));
				return glist;
			}
			return null;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public String findc(int anum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=MyDBCP.getConnection();
			String sql="select gcategory from storagebox where anum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public StorageboxVo findmusic() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=MyDBCP.getConnection();
			String sql="select * from storagebox where basicsetting=1 and gcategory='music'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				StorageboxVo glist= new StorageboxVo(0, 
						rs.getString("id"), 
						rs.getString("gcode"), 
						rs.getString("glink"), 
						rs.getString("gsaveimg"),
						rs.getString("gorgimg"), 
						rs.getString("gname"), 
						rs.getInt("purnum"),
						rs.getString("gcategory"), 
						rs.getInt("basicsetting"));
				return glist;
			}
			return null;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
}
