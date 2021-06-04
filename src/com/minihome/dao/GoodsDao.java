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
	public ArrayList<GoodsVo> goodslist(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from goods";
			pstmt=con.prepareStatement(sql);
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
