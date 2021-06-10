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
@WebServlet("/friendsay/list")
public class FriendsayListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum==null) {
			spageNum = "undefined";
		}
		if(!spageNum.equals("undefined")) {
			pageNum= Integer.parseInt(spageNum);
		}
		
		int startRow= (pageNum-1)*10+1;
		int endRow= startRow+9;
		
		int pageCount=(int)Math.ceil(FriendsayDao.getInstance().getCount(id)/10.0);
		int startPageNum= ((pageNum-1)/10*10)+1;
		int endPageNum= startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
			//boolean friend = FriendDao.getInstance().friendOK(id, gid);
		
		}
		ArrayList<FriendsayVo> list =  FriendsayDao.getInstance().friendsaylist(id, startRow, endRow);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.print("<result>");
		for(FriendsayVo vo : list) {
			pw.print("<reply>");
			pw.print("<fsnum>"+vo.getFsnum()+"</fsnum>");
			pw.print("<id>"+vo.getHid()+"</id>");
			pw.print("<gid>"+vo.getGid()+"</gid>");
			pw.print("<fscontent>"+vo.getFscontent()+"</fscontent>");
			pw.print("<fsstep>"+vo.getFsstep()+"</fsstep>");
			pw.print("<fsgroup>"+vo.getFsgroup()+"</fsgroup>");
			pw.print("<regdate>"+vo.getRegdate()+"</regdate>");
			pw.print("</reply>");
		}
		pw.print("<page>");
		pw.print("<pageNum>"+pageNum+"</pageNum>");
		pw.print("<startPageNum>"+startPageNum+"</startPageNum>");
		pw.print("<endPageNum>"+endPageNum+"</endPageNum>");
		pw.print("<startRow>"+startRow+"</startRow>");
		pw.print("<endRow>"+endRow+"</endRow>");
		pw.print("</page>");
		pw.print("</result>");
		
		
		
		
		
	}
}
