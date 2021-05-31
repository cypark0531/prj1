package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.minihome.db.MyDBCP;
import com.minihome.vo.MembersVO;

public class MembersDao {
	private static MembersDao instance = new MembersDao();
	private MembersDao() {};
	public static MembersDao getIntstance() {
		return instance;
	}
	
	public boolean idCheck(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where id=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return true;
			}else return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
	public boolean emailCheck(String email) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where id=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return true;
			}else return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
	public int insert(MembersVO vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into members values(?,?,?,?,?,?,?,0,1)";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getQuestion());
			pstmt.setString(7, vo.getAnswer());
			int n=pstmt.executeUpdate();
			return n;			
		}catch(SQLException e){
			e.printStackTrace();
			return -1;
		}finally{
			MyDBCP.close(con, pstmt, null);
		}
	}
	
	public String findId(MembersVO vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where name=? and email=? and phone=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPhone());
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString("id");
			}else return null;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
}
