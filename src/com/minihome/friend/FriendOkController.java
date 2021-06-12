package com.minihome.friend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendDao;
@WebServlet("/friend/friendOK")
public class FriendOkController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hid=req.getParameter("hid");
		String gid=req.getParameter("gid");
		FriendDao dao=FriendDao.getInstance();
		boolean n=dao.friendStateOK(hid,gid);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(n){
			pw.print("<code>success</code>");
		}else {
			pw.print("<code>fail</code>");			
		}
		pw.print("</result>");
	}
}
