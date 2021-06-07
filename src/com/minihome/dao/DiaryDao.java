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
		String cal = year+"-"+month+"-"+date;
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
}
