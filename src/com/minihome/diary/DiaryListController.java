package com.minihome.diary;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.DiaryDao;
import com.minihome.vo.BoardreplyVo;
import com.minihome.vo.DiaryVo;
@WebServlet("/diary/list")
public class DiaryListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		int date = Integer.parseInt(req.getParameter("date"));
		String id = req.getParameter("id");
		ArrayList<DiaryVo> list = DiaryDao.getInstance().getDiary(id, year, month, date);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.print("<result>");
		for(DiaryVo vo : list) {
			pw.print("<reply>");
			pw.print("<dnum>"+vo.getDnum()+"</drnum>");
			pw.print("<dcontent>"+vo.getDcontent()+"</dcontent>");
			pw.print("<dopen>"+vo.getDopen()+"</dopen>");
			pw.print("<id>"+vo.getId()+"</id>");
			pw.print("</reply>");
		}
		pw.print("</result>");
	}
}
