package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BasketVo;


public class BasketDao {
	private static BasketDao instance = new BasketDao();
	private BasketDao() {};
	public static BasketDao getInstance() {
		return instance;
	}
	
	public int binsert(BasketVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into basket values(basket_seq.nextval,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGsaveimg());
			pstmt.setString(3, vo.getGorgimg());
			pstmt.setInt(4, vo.getGprice());
			pstmt.setString(5, vo.getGname());
			pstmt.setString(6, vo.getGcode());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	
	public ArrayList<BasketVo> blist(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from basket where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			ArrayList<BasketVo> blist=new ArrayList<BasketVo>();
			while(rs.next()) {
				BasketVo vo=new BasketVo(
						rs.getInt("basnum"), 
						rs.getString("id"),
						rs.getString("gcode"),
						rs.getInt("gprice"),
						rs.getString("gname"),
						rs.getString("gsaveimg"), 
						rs.getString("gorgimg"));
				blist.add(vo);
			}
			return blist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int delete(int basnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="delete from basket where basnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, basnum);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
}
