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
//	id 갖고와서
//	id 맞는 cash를 수정
//	update members set cash = cash-money;멤버업데이트
//	public int update(String id) {
//		connection con=null;
//		preparedstatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			con=MyDBCP.getConnection();
//			String sql="update members set money(?)=money(?)-gprice(?) where id=?" ;
//			위에 sql을 쓸려면 join을 써야되는데 공통된 컬럼이 없어도 가능
//		}
//	}
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
	
	public ArrayList<PurchaseVo> list(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=MyDBCP.getConnection();
			String sql="select * from purchase where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
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
}
