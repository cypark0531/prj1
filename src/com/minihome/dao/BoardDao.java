package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BoardVo;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private BoardDao() {};
	public static BoardDao getInstance() {
		return instance;
	}
	public int getCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(count(bnum),0) from board where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
			String sql = "select NVL(max(bnum),0) mnum from board";
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

	public ArrayList<BoardVo> boardList(String id,int startRow,int endRow){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVo> boardlist = new ArrayList<BoardVo>();
		
		try {
			con = MyDBCP.getConnection();
			String sql= "select * from "
					+ "(select b.*,rownum rnum from(SELECT rownum step ,a.* FROM"
					+ "(SELECT * FROM BOARD WHERE ID = ? order by bnum asc )a"
					+ " order by step desc)b)"
					+ "where rnum >= ? and rnum <= ?";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo(
						rs.getInt("bnum"),
						id,
						rs.getString("btitle"),
						rs.getString("bcontent"),
						rs.getInt("bopen"),
						rs.getDate("regdate"),
						rs.getInt(1));
				boardlist.add(vo);
			}
			
			return boardlist;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		
	}
	public int boardInsert(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = MyDBCP.getConnection();
			String sql = "insert into board values(?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getmaxNum()+1);
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getBtitle());
			pstmt.setString(4, vo.getBcontent());
			pstmt.setInt(5, vo.getBopen());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
		
	}
	
}
