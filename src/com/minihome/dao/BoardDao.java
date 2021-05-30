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
	public ArrayList<BoardVo> boardList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVo> boardlist = new ArrayList<BoardVo>();
		
		try {
			con = MyDBCP.getConnection();
			String sql= "select * from (select rownum rnum ,b.* from (SELECT * FROM BOARD WHERE ID = ? order by bnum desc)b) order by rnum desc" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				BoardVo vo = new BoardVo(
						rs.getInt(1),
						id,
						rs.getString("btitle"),
						rs.getString("bcontent"),
						rs.getInt("bopen"),
						rs.getDate("regdate"));
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
	
}
