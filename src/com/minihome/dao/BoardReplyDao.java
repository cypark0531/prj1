package com.minihome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.BoardreplyVo;

public class BoardReplyDao {
	private static BoardReplyDao instance = new BoardReplyDao();
	private BoardReplyDao() {};
	public static BoardReplyDao getInstance() {
		return instance;
	}
	
	public ArrayList<BoardReplyDao> boardReplyList(int bnum){
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BoardreplyVo> boardReplylist = new ArrayList<BoardreplyVo>();
			
			try {
				con = MyDBCP.getConnection();
				String sql = "select * from boardReply where bnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "bnum");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					
				}
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				MyDBCP.close(con, pstmt, rs);
			}
			return null;
			
		}
}