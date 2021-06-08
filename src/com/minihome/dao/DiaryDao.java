package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.DiaryVo;

public class DiaryDao {
	private static DiaryDao instance = new DiaryDao();
	private DiaryDao() {};
	public static DiaryDao getInstance() {
		return instance;
	}
	
	public ArrayList<DiaryVo> getDiary(String id, int year, int month, int date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String cal = year+"-"+month+"-"+date;;
		ArrayList<DiaryVo> list = new ArrayList<DiaryVo>();
		try {
			con = MyDBCP.getConnection();
			String sql = "select * from diary where id = ? and regdate = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, cal);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int dnum = rs.getInt("dnum");
				String dcontent = rs.getString("dcontent");
				int dopen = rs.getInt("dopen");
				Date regdate = rs.getDate("regdate");
				DiaryVo vo = new DiaryVo(dnum, id, dcontent, dopen, regdate);
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
	public int getmaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =MyDBCP.getConnection();
			String sql = "select NVL(max(dnum),0) mnum from diary";
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
	public int insert(DiaryVo vo,int year,int month,int date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			String sql = "insert into Diary values(?,?,?,?,?)";
			String regdate = year +"-"+month+"-"+date;
			System.out.println(regdate);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getmaxNum()+1);
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getDcontent());
			pstmt.setInt(4, vo.getDopen());
			pstmt.setString(5, regdate);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	
	}
	public int delete(int dnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			String sql = "delete from Diary where dnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dnum);
			
			return pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
		return -1;
	}finally {
		MyDBCP.close(con, pstmt, null);
	}
	}
}
