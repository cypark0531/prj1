package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.FriendVo;

public class FriendDao {
	private static FriendDao instance = new FriendDao();
	private FriendDao() {}
	public static FriendDao getInstance() {
		return instance;
	}
	public boolean friendOK(String id , String gid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean friend = false;
		try {
			con = MyDBCP.getConnection();
			String sql = "Select * from friend where (hid = ? and gid = ?) or (hid = ? and gid = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gid);
			pstmt.setString(3, gid);
			pstmt.setString(4, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt("friendState")==3) {
					friend = true;
				}else {
					friend = false;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return friend;
	}
	public boolean friendStateOK(String id , String gid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean friend = false;
		try {
			con = MyDBCP.getConnection();
			String sql = "Select * from friend where (hid = ? and gid = ?) or (hid = ? and gid = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gid);
			pstmt.setString(3, gid);
			pstmt.setString(4, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
					friend = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return friend;
	}
	public int getFriendState(String id , String gid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int friend = 0;
		try {
			con = MyDBCP.getConnection();
			String sql = "Select * from friend where (hid = ? and gid = ?) or (hid = ? and gid = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gid);
			pstmt.setString(3, gid);
			pstmt.setString(4, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String id1=rs.getString(2);
				String id2=rs.getString(3);
				String state=rs.getString(4);
				if(id1.equals(id)) {
					return Integer.parseInt(state);
				}
				else{
					if(state.equals("3")) return Integer.parseInt(state);
					else return 2;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return friend;
	}
	public ArrayList<FriendVo> getFriend(String host,int page) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FriendVo> list = new ArrayList<>();
		int firstrow=page+(page-1)*20;
		int lastrow=firstrow+19;
		String sql = "select f.* from "+
				"(Select friend.* from friend where (gid =? or hid=?) and friendstate = 3) f "+ 
				"where rownum>=? and rownum<=?";
		try {
			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host);
			pstmt.setString(2, host);
			pstmt.setInt(3, firstrow);
			pstmt.setInt(4, lastrow);
			rs = pstmt.executeQuery();
			if(rs.next())do {
				int num=rs.getInt(1);
				String id1=rs.getString(2);
				String id2=rs.getString(3);
				String state=rs.getString(4);
				if(id1.equals(host)) {
					list.add(new FriendVo(num, id2, null, state));
				}
				else{
					if(state.equals("3"))list.add(new FriendVo(num, id1, null, state));
					else list.add(new FriendVo(num, id1, null, "2"));
				}
			}while(rs.next());
			else return null;
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public ArrayList<String> getFriend(String host) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<>();
		String sql = "select f.* from "+
				"(Select friend.* from friend where (gid =? or hid=?) and friendstate = 3) f "+ 
				"where rownum>=1 and rownum<=12";
		try {
			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host);
			pstmt.setString(2, host);
			rs = pstmt.executeQuery();
			if(rs.next())do {
				int num=rs.getInt(1);
				String id1=rs.getString(2);
				String id2=rs.getString(3);
				String state=rs.getString(4);
				if(id1.equals(host)) {
					list.add(id2);
				}
				else{
					list.add(id1);
				}
			}while(rs.next());
			else return null;
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public ArrayList<FriendVo> getFriendAll(String host,int page) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FriendVo> list = new ArrayList<>();
		int firstrow=page+(page-1)*20;
		int lastrow=firstrow+19;
		String sql = "select f.* from "+
				"(Select friend.* from friend where (gid =? or hid=?) order by friendstate asc) f "+ 
				"where rownum>=? and rownum<=?";
		try {
			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host);
			pstmt.setString(2, host);
			pstmt.setInt(3, firstrow);
			pstmt.setInt(4, lastrow);
			rs = pstmt.executeQuery();
			if(rs.next())do {
				int num=rs.getInt(1);
				String id1=rs.getString(2);
				String id2=rs.getString(3);
				String state=rs.getString(4);
				if(id1.equals(host)) {
					list.add(new FriendVo(num, id2, null, state));
				}
				else{
					if(state.equals("3"))list.add(new FriendVo(num, id1, null, state));
					else list.add(new FriendVo(num, id1, null, "2"));
				}
			}while(rs.next());
			else return null;
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int lastPage(String host) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select NVL(count(friendnum),0) from friend where (gid =? or hid=?) order by friendstate asc";
		try {
			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host);
			pstmt.setString(2, host);			
			rs = pstmt.executeQuery();
			rs.next();
			double num=Math.ceil(rs.getInt(1)/20.0);			
			return (int)num;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int update(int fnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update friend set friendstate=3 where friendnum=?";
		try {			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fnum);			
			int n=pstmt.executeUpdate();	
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int delete(int fnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from friend where friendnum=?";
		try {			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fnum);			
			int n=pstmt.executeUpdate();	
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int addFriend(String hid,String gid) {//hid:신청한 사람, gid:받는 사람
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into friend values(friend_seq.nextval,?,?,1)";//friend_seq필요
		try {			
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hid);			
			pstmt.setString(2, gid);			
			int n=pstmt.executeUpdate();	
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
}
