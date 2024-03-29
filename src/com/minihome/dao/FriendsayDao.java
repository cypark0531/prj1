package com.minihome.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.minihome.db.MyDBCP;
import com.minihome.vo.FriendsayVo;

public class FriendsayDao {
	
		private static FriendsayDao instance = new FriendsayDao();
		private FriendsayDao() {};
		public static FriendsayDao getInstance() {
			return instance;
		}
		public int getCount(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con =MyDBCP.getConnection();
				String sql = "select NVL(count(fsnum),0) from friendsay where hid = ? and fsstep=0";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				rs.next();
				int mnum = rs.getInt(1);
				return mnum;
					
				}catch(Exception e) {
					e.printStackTrace();
					return -1;
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
				String sql = "select NVL(max(fsnum),0) mnum from friendsay";
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
		public ArrayList<FriendsayVo> friendsaylist(String id, int startRow,int endRow){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<FriendsayVo> list = new ArrayList<FriendsayVo>();
			try {
			con = MyDBCP.getConnection();
			String sql = "select * from (select rownum rnum, b.* from (select * from friendsay where hid = ?  and fsstep = 0 order by fsnum desc)b) where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int fsnum = rs.getInt("fsnum");
				String fscontent = rs.getString("fscontent");
				int fsgroup = rs.getInt("fsgroup");
				int fsstep = rs.getInt("fsstep");
				String gid = rs.getString("gid");
				Date regdate = rs.getDate("regdate");
				FriendsayVo vo = new FriendsayVo(fsnum, id, fscontent, fsstep, fsgroup, regdate, gid);
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
		public ArrayList<FriendsayVo> friendsayreplylist(int fsgroup){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<FriendsayVo> list = new ArrayList<FriendsayVo>();
			try {
			con = MyDBCP.getConnection();
			String sql = "select * from friendsay where fsgroup = ?  and fsstep = 1 order by fsnum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fsgroup);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int fsnum = rs.getInt("fsnum");
				String fscontent = rs.getString("fscontent");
				String id = rs.getString("hid");
				int fsstep = rs.getInt("fsstep");
				String gid = rs.getString("gid");
				Date regdate = rs.getDate("regdate");
				FriendsayVo vo = new FriendsayVo(fsnum, id, fscontent, fsstep, fsgroup, regdate, gid);
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
		public int insert(FriendsayVo vo) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
			int fsnum = getmaxNum()+1;
			int fsgroup = vo.getFsgroup();
			int fsstep = 1;
			if(fsgroup==0) {
				fsgroup = fsnum;
				fsstep = 0;
			}
			try {
				con = MyDBCP.getConnection();
				String sql = "insert into friendsay values(?,?,?,?,?,sysdate,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fsnum);
				pstmt.setString(2, vo.getHid());
				pstmt.setString(3, vo.getFscontent());
				pstmt.setInt(4, fsstep);
				pstmt.setInt(5, fsgroup);
				pstmt.setString(6, vo.getGid());
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				return -1;
			}
			
		}
		public int delete(int fsgroup,int fsnum) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = MyDBCP.getConnection();
			if(fsnum==0) {
				String sql = "delete from friendsay where fsgroup = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fsgroup);
			}else {
				String sql = "delete from friendsay where fsnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fsnum);
			}
		
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				return -1;
			}
			
		}
		
	}