package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.GoodsVo;


public class GoodsDao {
	private static GoodsDao instance = new GoodsDao();
	private GoodsDao() {};
	public static GoodsDao getInstance() {
		return instance;
	}
	public ArrayList<GoodsVo> goodslist(int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from "
					+ "("
					+ "select goods.*,rownum rnum from"
					+  "("
					+   "select * from goods order by gcode desc"
					+ ")goods"
					+ "  )where rnum>=? and rnum<=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<GoodsVo> glist = new ArrayList<GoodsVo>();
			while(rs.next()) {
				GoodsVo vo=new GoodsVo(
						rs.getString("gcode"),
						rs.getInt("gprice"), 
						rs.getString("gname"),
						rs.getString("gsaveimg"), 
						rs.getString("gorgimg"), 
						rs.getString("gcategory"));
				glist.add(vo);
			}
			return glist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
	public int goodsmoney(int gprice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from goods where gprice=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, gprice);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rs.getString("gcode");
				rs.getInt("gprice");
				rs.getString("gname");
				rs.getString("gsaveimg"); 
				rs.getString("gorgimg"); 
				rs.getString("gcategory");
			}
			return -1;
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
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
			String sql="select NVL(count(*),0) from goods";
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
	
	public int getCount1(String gcategory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select NVL(count(*),0) from goods where gcategory=?";
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

	//카테고리
	public ArrayList<GoodsVo> gclist(String gcategory, int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from "
					+ "("
					+ "select goods.*,rownum rnum from "
					+  "("
					+   "select * from goods where gcategory=? order by gcode desc"
					+ ")goods"
					+ "  )where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gcategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<GoodsVo> gclist = new ArrayList<GoodsVo>();
			while(rs.next()) {
				GoodsVo vo=new GoodsVo(
						rs.getString("gcode"),
						rs.getInt("gprice"), 
						rs.getString("gname"),
						rs.getString("gsaveimg"), 
						rs.getString("gorgimg"), 
						rs.getString("gcategory"));
				gclist.add(vo);
			}
			return gclist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int goodsinsert(GoodsVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into goods values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getGcode());
			pstmt.setInt(2, vo.getGprice());
			pstmt.setString(3, vo.getGname());
			pstmt.setString(4, vo.getGsaveimg());
			pstmt.setString(5, vo.getGorgimg());
			pstmt.setString(6, vo.getGcategory());
			System.out.println(vo.getGcode());
			System.out.println(vo.getGname());
			System.out.println(vo.getGsaveimg());
			System.out.println(vo.getGorgimg());
			System.out.println(vo.getGcategory());
			System.out.println(vo.getGname());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
}
