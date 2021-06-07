package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import com.minihome.db.MyDBCP;

public class VisitDao {
	private static VisitDao instance = new VisitDao();
	private VisitDao() {};
	public static VisitDao getInstance() {
		return instance;
	}
	public int countAll(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		con = MyDBCP.getConnection();
		String sql = "select sum(dayvisitnum) from visit where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		return -1;
		}catch(Exception e ) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int countToday(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 Calendar c=Calendar.getInstance();
			
			int currYear=c.get(c.YEAR);//현재년
			int currMonth=c.get(c.MONTH)+1;//현재월
			int currday = c.get(c.DAY_OF_MONTH);
			String today = currYear+"-"+currMonth+"-"+currday;
			
		try {
		con = MyDBCP.getConnection();
		String sql = "select dayvisitNum from visit where id = ? and regdate = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, today);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		return -1;
		}catch(Exception e ) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int updateVisit(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 Calendar c=Calendar.getInstance();
			
			int currYear=c.get(c.YEAR);//현재년
			int currMonth=c.get(c.MONTH)+1;//현재월
			int currday = c.get(c.DAY_OF_MONTH);
			String today = currYear+"-"+currMonth+"-"+currday;
		try {
		con = MyDBCP.getConnection();
		String sql = "update Visit set dayvisitNum = dayvisitNum+1 where id = ? and regdate = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, today);
		return pstmt.executeUpdate();
		}catch(Exception e ) {
			e.printStackTrace();
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		
	}
}
