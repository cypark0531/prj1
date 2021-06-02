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
		String sql = "select * from boardreply where bnum = ? and level = 0;";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bnum);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int brnum = rs.getInt("brnum");
			String id = rs.getString("id");
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
	
}
































