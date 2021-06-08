package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.ScheduleVo;

public class ScheduleDao {
	private ScheduleDao() {}
	private static ScheduleDao dao=new ScheduleDao();
	public static ScheduleDao getInstance() {
		return dao;
	}
	public ArrayList<Integer> getNum(String id,int rel){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Integer> list=new ArrayList<>();
		String sql="select * from schedule where id=? and schopen<=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rel);
			rs=pstmt.executeQuery();
			rs.next();
			{
				do {
					list.add(rs.getInt(1));
				}while(rs.next());
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public ScheduleVo getSchedule(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ScheduleVo vo=null;
		String sql="select * from schedule where schnum=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			rs.next();
			vo= new ScheduleVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),rs.getDate(6));			
			return vo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			MyDBCP.close(con, pstmt, rs);
		}
	}
	public int setSchedule(ScheduleVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into schedule values(SCHEDULE_SEQ.nextval,?,?,?,?,?)";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getSchtitle());
			pstmt.setString(3, vo.getSchcontent());
			pstmt.setInt(4, vo.getSchopen());
			pstmt.setDate(5, vo.getSchdate());
			int n=pstmt.executeUpdate();
			if(n>0) {
				return n;
			}else return -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public int updateSchedule(ScheduleVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update schedule set schtitle=?,schcontent=?, schdate=?, schopen=? where schnum=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getSchtitle());
			pstmt.setString(2, vo.getSchcontent());
			pstmt.setDate(3, vo.getSchdate());
			pstmt.setInt(4, vo.getSchopen());
			pstmt.setInt(5, vo.getSchnum());
			int n=pstmt.executeUpdate();
			if(n>0) {
				return n;
			}else return -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			MyDBCP.close(con, pstmt, null);
		}
	}	
}
