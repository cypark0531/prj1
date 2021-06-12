package com.minihome.diary;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/diary/main")
public class DiaryController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Calendar c=null;
		String id= (String) req.getSession().getAttribute("id");
		String gid= (String) req.getSession().getAttribute("gid");
		String year=(String)req.getParameter("year");
		String month=(String)req.getParameter("month");
		if(year!=null) {
		c=Calendar.getInstance();
		c.set(Integer.parseInt(year), Integer.parseInt(month)-1, 1);
		}else c=Calendar.getInstance();
		int currYear=c.get(c.YEAR);//현재년
		int currMonth=c.get(c.MONTH);//현재월
		int currDay= c.get(c.DAY_OF_MONTH);
		int lastDay=c.getActualMaximum(c.DAY_OF_MONTH);
		Calendar fDay =Calendar.getInstance();
		fDay.set(currYear, currMonth-1, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);
		Calendar cc =Calendar.getInstance();
		int realYear = cc.get(c.YEAR);
			System.out.println(currDay);
			resp.sendRedirect(req.getContextPath()+"/diary/diary.jsp?id="+id+"&gid="+gid+"&year="+currYear+"&month="+currMonth+
			"&fisrtDay="+firstDay+"&lastDay="+lastDay+"&day="+currDay+"&realYear="+realYear);
//			String path = req.getContextPath()+"/diary/diary.jsp?id="+id+"&gid="+gid+"&year="+currYear+"&month="+currMonth1+
//					"&fisrtDay="+firstDay+"&lastDay="+lastDay+"&day="+currDay;
//			resp.sendRedirect(req.getContextPath()+"/home?path="+path);
//			req.getRequestDispatcher().forward(req, resp);
	}
}
