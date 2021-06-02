package com.minihome.boardreply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardReplyDao;
import com.minihome.vo.BoardreplyVo;

@WebServlet("/boardreply/list")
public class BoardreplyListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("bnum = "+req.getParameter("bnum"));
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		ArrayList<BoardreplyVo> list = BoardReplyDao.getInstance().boardreplylist(bnum);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.print("<result>");
		for(BoardreplyVo vo : list) {
			pw.print("<reply>");
			pw.print("<brnum>"+vo.getBrnum()+"</brnum>");
			pw.print("<bnum>"+vo.getBnum()+"</bnum>");
			pw.print("<id>"+vo.getHid()+"</id>");
			pw.print("<brcontent>"+vo.getBrcontent()+"</brcontent>");
			pw.print("<bgroup>"+vo.getBgroup()+"</bgroup>");
			pw.print("<brlevel>"+vo.getBrlevel()+"</brlevel>");
			pw.print("<gid>"+vo.getGid()+"</gid>");
			pw.print("<regdate>"+vo.getRegdate()+"</regdate>");
			pw.print("</reply>");
		}
		pw.print("</result>");
		
		
		
	}
	
}
