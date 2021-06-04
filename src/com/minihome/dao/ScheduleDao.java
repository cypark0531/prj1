package com.minihome.dao;

import java.sql.Connection;
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
	public ArrayList<ScheduleVo> getSchedule(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ScheduleVo> list=new ArrayList<ScheduleVo>();
		String sql="select * from schedule where id=?";
		try {
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			{
				do {
					ScheduleVo vo=new ScheduleVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDate(6));
					list.add(vo);
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
}
