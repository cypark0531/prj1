package com.minihome.friend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendDao;
@WebServlet("/friend/delete")
public class DeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int fnum=Integer.parseInt(req.getParameter("fnum"));
		FriendDao dao=FriendDao.getInstance();
		int n=dao.delete(fnum);
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(n>0) {
			pw.print("<code>success</code>");
		}else {
			pw.print("<code>fail</code>");			
		}
		pw.print("</result>");
	}
}
