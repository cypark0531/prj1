package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

import com.minihome.db.MyDBCP;
import com.minihome.vo.GalleryVo;
import com.minihome.vo.ProfilesVo;

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
	public GalleryVo getinfoVo(int galnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from gallery where galnum =?";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, galnum);
			rs= pstmt.executeQuery();
			if(rs.next()) {		
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
				GalleryVo vo = new GalleryVo(rs.getInt("galnum"),
										rs.getString("id"),
										rs.getString("galtitle"),
										rs.getString("galcontent"),
										rs.getString("galorgname"),
										rs.getString("galsavename"),
										rs.getInt("galopen"),
										rs.getDate("regdate"));
						return vo;
			}
		
		}catch (SQLException se) {
			se.printStackTrace();
			
			// TODO: handle exception
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return null;
	}
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
	public int update(GalleryVo vo) {
		String sql ="update gallery set galtitle=?,galcontent=?,galorgname=?,galsavename=?,galopen=? where galnum =?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,vo.getGaltitle());
			pstmt.setString(2, vo.getGalorgname());
			pstmt.setString(3, vo.getGalsavename());
			pstmt.setString(4, vo.getGalcontent());
			pstmt.setInt(5, vo.getGalopen());
			pstmt.setString(6, vo.getId());
			int n = pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
			// TODO: handle exception
		}finally {
			MyDBCP.close(con, pstmt, null);
		}
	}
	public ArrayList<GalleryVo> galleryList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<GalleryVo> list = new ArrayList<GalleryVo>();
		try {
			con = MyDBCP.getConnection();
		String sql = "select*from gallery where id =? order by regdate desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int galnum1 = rs.getInt("galnum");
			String galtitle = rs.getString("galtitle");
			String galcontent = rs.getString("galcontent");
			String galorgname = rs.getString("galorgname");
			String galsavename = rs.getString("galsavename");
			int galopen = rs.getInt("galopen");
			Date regdate = rs.getDate("regdate");
			GalleryVo vo = new GalleryVo(galnum1, id, galtitle, galcontent, galorgname, galsavename, galopen, regdate);
			list.add(vo);
		}
			return list;
		}catch (SQLException se) {
			se.printStackTrace();
			return null;
			// TODO: handle exception
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		
	}
	public GalleryVo getRecent(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from gallery where id=? order by regdate desc";
		try {
			con = MyDBCP.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {		
				GalleryVo vo = new GalleryVo(rs.getInt("galnum"),
										rs.getString("id"),
										rs.getString("galtitle"),
										rs.getString("galcontent"),
										rs.getString("galorgname"),
										rs.getString("galsavename"),
										rs.getInt("galopen"),
										rs.getDate("regdate"));
						return vo;
			}
		
		}catch (SQLException se) {
			se.printStackTrace();
			
			// TODO: handle exception
		}finally {
			MyDBCP.close(con, pstmt, rs);
		}
		return null;
	}


	
}
