package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BoardVo;
import com.minihome.vo.DiaryVo;
import com.minihome.vo.HistoriesVo;

public class HistoriesDao {
	private static HistoriesDao	instance = new HistoriesDao();
	private HistoriesDao() {
		// TODO Auto-generated constructor stub
	}
	public static HistoriesDao getInstance() {
		return instance;
	}
	public int getmaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(max(dnum),0) mnum from histories";
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
	public int insert(HistoriesVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			String sql = "insert into histories values(?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getmaxNum()+1);
			pstmt.setString(2, vo.getHid());
			pstmt.setString(3, vo.getHtitle());
			pstmt.setString(4, vo.getHcontent());
			pstmt.setString(5, vo.getGid());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
		
	}
	public int delete(int bnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			String sql = "delete from histories where bnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
		
	}
	public ArrayList<HistoriesVo> list(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HistoriesVo> list = new ArrayList<HistoriesVo>();
		
		try {
			con = MyDBCP.getConnection();
			String sql= "select * from histories where id = ? order by regdate desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoriesVo vo = new HistoriesVo(rs.getInt("hnum"),
						id,
						rs.getString("HTITLE"),
						rs.getString("HCONTENT"), 
						rs.getString("GID"),
						rs.getDate("regdate"));
				}
			
			return list;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int getCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(count(hnum),0) from histories where id = ? ";
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
}
