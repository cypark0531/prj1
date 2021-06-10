package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.PurchaseVo;


public class PurchaseDao {
	private static PurchaseDao instance = new PurchaseDao();
	private PurchaseDao() {}
	public static PurchaseDao getInstance() {
		return instance;
	}
	
	public int PurchaseInsert(PurchaseVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into purchase values(purchase_seq.nextval,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGcode());
			return pstmt.executeUpdate();
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	
	public int PurchaseDelete(int purnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="delete from purchase where purnum=?";
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
	
	public ArrayList<PurchaseVo> list(String id, int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from "
					+ "("
					+ "select purchase.*,rownum rnum from "
					+  "("
					+   "select * from purchase where id=? order by purnum desc"
					+ ")purchase"
					+ "  )where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<PurchaseVo> plist=new ArrayList<PurchaseVo>();
			while(rs.next()) {
				PurchaseVo vo= new PurchaseVo(
						rs.getInt("purnum"), 
						rs.getString("id"), 
						rs.getString("gcode"),
						rs.getDate("regdate"));
				plist.add(vo);
			}
			return plist;
		}catch (SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int getCount(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select NVL(count(*),0) from purchase where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
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
