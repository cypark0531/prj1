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
	
	public ArrayList<BoardreplyVo> boardReplyList(int bnum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BoardreplyVo> boardReplylist = new ArrayList<BoardreplyVo>();
			
			try {
				con = MyDBCP.getConnection();
				String sql = "select * from boardReply where bnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int brnum =	rs.getInt("brnum");
					String hid = rs.getString("hid");
					String brcontent = rs.getString("brcontent");
					int brgroup = rs.getInt("bgroup");
					int brlevel = rs.getInt("brlevel");
					int brstep = rs.getInt("brstep");
					String gid = rs.getString("gid");
					Date date = rs.getDate("regdate");
					
					BoardreplyVo vo = new BoardreplyVo(brnum, bnum, hid, brcontent, brgroup, brlevel, brstep, gid, date);
					boardReplylist.add(vo);
				}
				return boardReplylist;
				
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				MyDBCP.close(con, pstmt, rs);
			}
			
		}
	
	public int insert(BoardreplyVo vo) {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
			
		try {
		con = MyDBCP.getConnection();
			int brnum = getmaxNum()+1; //글번호
			int bnum = vo.getBnum();
			int brgroup = vo.getBgroup();
			int brlevel= vo.getBrlevel();
			int brstep=vo.getBrstep();
			if(brgroup==0) {
				brgroup=bnum;
				
			}else {
				String sql1="update boardreply set step=step+1 where brlevel=? and step>?";              		
	                      pstmt2=con.prepareStatement(sql1);
				pstmt2.setInt(1, brlevel);
				pstmt2.setInt(2, brstep);
				pstmt2.executeUpdate();
				brlevel+=1;
				brstep+=1;
			}
			String sql = "insert into boardreply values(?,?,?,?,?,?,?,?,?)";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setInt(1, brnum);
			pstmt1.setInt(2, vo.getBnum());
			pstmt1.setString(3, vo.getHid());
			pstmt1.setString(4, vo.getBrcontent());
			pstmt1.setInt(5, brgroup);
			pstmt1.setInt(6, brlevel);
			pstmt1.setInt(7, brstep);
			pstmt1.setString(8,vo.getGid());
			pstmt1.setDate(9, vo.getRegdate());
			return pstmt1.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				MyDBCP.close(null,pstmt2,null);
				MyDBCP.close(con,pstmt1,null);
			
			}
		}
	
	}
































