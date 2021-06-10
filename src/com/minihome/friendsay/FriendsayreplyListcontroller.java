package com.minihome.friendsay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendsayDao;
import com.minihome.vo.FriendsayVo;
@WebServlet("/friendsay/replylist")
public class FriendsayreplyListcontroller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int fsgroup = Integer.parseInt(req.getParameter("fsgroup"));
		ArrayList<FriendsayVo> list = FriendsayDao.getInstance().friendsayreplylist(fsgroup);
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.print("<result>");
		for(FriendsayVo vo : list) {
			pw.print("<reply>");
			pw.print("<refsnum>"+vo.getFsnum()+"</refsnum>");
			pw.print("<reid>"+vo.getHid()+"</reid>");
			pw.print("<regid>"+vo.getGid()+"</regid>");
			pw.print("<refscontent>"+vo.getFscontent()+"</refscontent>");
			pw.print("<refsstep>"+vo.getFsstep()+"</refsstep>");
			pw.print("<refsgroup>"+vo.getFsgroup()+"</refsgroup>");
			pw.print("<reregdate>"+vo.getRegdate()+"</reregdate>");
			pw.print("</reply>");
		}
		pw.print("</result>");
	}
}
