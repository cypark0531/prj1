package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;

import com.minihome.db.MyDBCP;
import com.minihome.vo.GalleryVo;

public class GalleryDao  {
	private static GalleryDao instance = new GalleryDao();
	
	private GalleryDao() {
		
	}
	public static GalleryDao getInstance() {
		return instance;
	}
	public int insert(GalleryVo vo) {
		Connection con =null;
		PreparedStatement pstmt = null;
		String sql ="insert into gallery values(gallery_seq.nextval,?,?,?,?,?,?,sysdate)";
		try {
			con=MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
	
			/*
				private int galnum;
				private String id;
				private String galtitle;
				private String galcontent;
				private String galorgname;
				private String galsavename;
				private int galopen;
				private Date regdate;
			 */
			//pstmt.setInt(1, vo.getGalnum());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getGaltitle());
			pstmt.setString(3, vo.getGalcontent());
			pstmt.setString(4, vo.getGalorgname());
			pstmt.setString(5, vo.getGalsavename());
			pstmt.setInt(6, vo.getGalopen());
			return pstmt.executeUpdate();
		}catch (SQLException se) {
			se.printStackTrace();
			// TODO: handle exception
			return -1;
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public GalleryVo getinfoVo(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs  null;
		
	}
	
	
	
}
