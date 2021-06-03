package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BoardreplyVo;

public class BoardReplyDao {
	private static BoardReplyDao instance = new BoardReplyDao();
	private BoardReplyDao() {};
	public static BoardReplyDao getInstance() {
		return instance;
	}
	public int getCount(int bnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(count(bnum),0) from boardreply where bnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bnum);
			rs = pstmt.executeQuery();
			rs.next();
			int mnum = rs.getInt(1);
			return mnum;
				
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				MyDBCP.close(con, pstmt, rs);
			}
	}
	public int getmaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(max(brnum),0) mnum from boardreply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int mnum = rs.getInt("mnum");
			return mnum;
				
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				MyDBCP.close(con, pstmt, rs);
			}
		}
	public ArrayList<BoardreplyVo> boardreplylist(int bnum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardreplyVo> list = new ArrayList<BoardreplyVo>();
		try {
		con = MyDBCP.getConnection();
		String sql = "select * from boardreply where bnum = ? and brlevel = 0 order by brnum asc";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bnum);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int brnum = rs.getInt("brnum");
			String id = rs.getString("hid");
			String brcontent = rs.getString("brcontent");
			int bgroup = rs.getInt("bgroup");
			int brlevel = rs.getInt("brlevel");
			int brstep = rs.getInt("brstep");
			String gid = rs.getString("gid");
			Date regdate = rs.getDate("regdate");
			BoardreplyVo vo = new BoardreplyVo(brnum, bnum, id, brcontent, bgroup, brlevel, brstep, gid, regdate);
			list.add(vo);
		}
		return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int boardreplyDelete(int bgroup) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			String sql = "delete from boardreply where bgroup = ? order by brnum asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null );
		}
	}
	public ArrayList<BoardreplyVo> boardrereplyList(int bgroup){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardreplyVo> list = new ArrayList<BoardreplyVo>();
		try {
		con = MyDBCP.getConnection();
		String sql = "select * from boardreply where bgroup = ? and brlevel = 1 order by brnum asc";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bgroup);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int brnum = rs.getInt("brnum");
			String id = rs.getString("hid");
			String brcontent = rs.getString("brcontent");
			int bnum = rs.getInt("bnum");
			int brlevel = rs.getInt("brlevel");
			int brstep = rs.getInt("brstep");
			String gid = rs.getString("gid");
			Date regdate = rs.getDate("regdate");
			BoardreplyVo vo = new BoardreplyVo(brnum, bnum, id, brcontent, bgroup, brlevel, brstep, gid, regdate);
			list.add(vo);
		}
		return list;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int reinsert(BoardreplyVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int brgroup = vo.getBgroup();
		if(brgroup==0) {
			brgroup = getmaxNum()+1;
		}
		try {
		con = MyDBCP.getConnection();
		String sql = "insert into boardreply values(?,?,?,?,?,?,?,?,sysdate)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, getmaxNum()+1);
		pstmt.setInt(2, vo.getBnum());
		pstmt.setString(3, vo.getHid());
		pstmt.setString(4, vo.getBrcontent());
		pstmt.setInt(5, brgroup);
		pstmt.setInt(6,vo.getBrlevel());
		pstmt.setInt(7, vo.getBrstep());
		pstmt.setString(8, vo.getGid());
		
		return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
		
	}
	
}
































