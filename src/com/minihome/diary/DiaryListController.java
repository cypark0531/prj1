package com.minihome.diary;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardReplyDao;
import com.minihome.dao.DiaryDao;
import com.minihome.vo.DiaryVo;
@WebServlet("/diary/list")
public class DiaryListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		int date = Integer.parseInt(req.getParameter("date"));
		String id = (String) req.getSession().getAttribute("id");

		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(!spageNum.equals("undefined")) {
			pageNum= Integer.parseInt(spageNum);
		}
		
		int startRow= (pageNum-1)*5+1;
		int endRow= startRow+4;
		
		int pageCount=(int)Math.ceil(DiaryDao.getInstance().getCount(id,year,month,date)/5.0);
		System.out.println(pageCount);
		int startPageNum= ((pageNum-1)/5*5)+1;
		int endPageNum= startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
			//boolean friend = FriendDao.getInstance().friendOK(id, gid);
		
		}
		
		
		ArrayList<DiaryVo> list = DiaryDao.getInstance().getDiary(id, year, month, date,startRow,endRow);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.print("<result>");
		for(DiaryVo vo : list) {
			pw.print("<reply>");
			pw.print("<dnum>"+vo.getDnum()+"</dnum>");
			pw.print("<dcontent>"+vo.getDcontent()+"</dcontent>");
			pw.print("<dopen>"+vo.getDopen()+"</dopen>");
			pw.print("<id>"+vo.getId()+"</id>");
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
