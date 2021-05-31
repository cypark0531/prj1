package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.db.MyDBCP;
@WebServlet("/login/emailoverlapck")
public class EmailOverlapckController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where email=?";
		String using="false";
		try{
			con=MyDBCP.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()){
				using="true";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			MyDBCP.close(con, pstmt, rs);
		}
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.write("<result>");
		pw.print("<using>"+using+"</using>");
		pw.print("</result>");
	}
}
