package com.minihome.friend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendDao;
@WebServlet("/friend/addfriend")
public class AddFreindController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hid=req.getParameter("hid");
		String gid=req.getParameter("gid");
		FriendDao dao=FriendDao.getInstance();
		boolean b=dao.friendStateOK(hid,gid);
		int n=0;
		if(b)n=dao.addFriend(hid,gid);
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(n>0) {
			pw.print("<code>success</code>");
			pw.print("<reason></reason>");
		}else {
			pw.print("<code>fail</code>");
			if(!b)pw.print("<reason>already</reason>");
			else pw.print("<reason></reason>");
		}
		pw.print("</result>");
	}
}
