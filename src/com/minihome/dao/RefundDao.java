package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.PurchaseVo;
import com.minihome.vo.RefundVo;



public class RefundDao {
	private static RefundDao instance = new RefundDao();
	private RefundDao() {};
	public static RefundDao getInstance() {
		return instance;
	}
	
	public int RefundInsert(RefundVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=MyDBCP.getConnection();
			String sql="insert into refund values(refund_seq.nextval,?,?,0,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGcode());
			pstmt.setInt(3, vo.getPurnum());
			return pstmt.executeUpdate();
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	
	public ArrayList<RefundVo> list(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();	
			String sql="select * from refund where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			ArrayList<RefundVo> rlist=new ArrayList<RefundVo>();
			while(rs.next()) {
				RefundVo vo=new RefundVo(
						rs.getInt("refnum"), 
						rs.getString("id"),
						rs.getString("gcode"),
						rs.getInt("refstate"),
						rs.getInt("purnum"), 
						rs.getDate("regdate"));
				rlist.add(vo);
			}
			return rlist;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
}
