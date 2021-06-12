package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public boolean nameCheck(String name) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where name=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
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
		String sql="select * from members where email=?";
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
		String sql="select * from members where email=? and phone=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPhone());
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
	
	public String findPwd(MembersVO vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where id=? and question=? and answer=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getQuestion());
			pstmt.setString(3, vo.getAnswer());
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString("pwd");
			}else return null;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	
	public boolean login(String id,String pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where id=? and pwd=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
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
	public int getMoney(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members money where id = ?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			System.out.println(id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt("money");
			}
			return -1;
		}catch(SQLException e){
			e.printStackTrace();
			return -1;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int moneyUpdate(String id,int gprice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update Members set money=money-? where id=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,gprice);
			pstmt.setString(2,id);
			return pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			return -1;
		}finally{
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int moneyRefund(String id,int gprice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update Members set money=money+? where id=?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,gprice);
			pstmt.setString(2,id);
			return pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			return -1;
		}finally{
			MyDBCP.close(con, pstmt, null);
		}
	}
	public String getName(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select name from members money where id = ?";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
			return null;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public ArrayList<MembersVO> getMembers(String str) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MembersVO> list=new ArrayList<>();
		String sql="select * from members where id like ? and rownum<=10";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+str+"%");
			rs=pstmt.executeQuery();
			while(rs.next()){
				System.out.println("asdf:"+rs.getString(1));
				list.add(new MembersVO(rs.getString(1), null, rs.getString(3), null, null, null, null, 0, 0));
			}
			return list;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
	}
}
