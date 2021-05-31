package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.minihome.db.MyDBCP;

public class FriendDao {
	private static FriendDao instance = new FriendDao();
	private FriendDao() {}
	public static FriendDao getInstance() {
		return instance;
	}
	public boolean friendOK(String id , String gid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean friend = false;
		try {
			con = MyDBCP.getConnection();
			String sql = "Select * from friend where hid = ? and gid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt("friendState")==3) {
					friend = true;
				}else {
					friend = false;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return friend;
	}
}
