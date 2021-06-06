package com.minihome.diary;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/diary")
public class DiaryController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Calendar c=null;
		String id= req.getParameter("id");
		String gid= req.getParameter("gid");
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
		fDay.set(currYear, currMonth, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);
			int currMonth1 = currMonth+1;
			System.out.println(currDay);
			resp.sendRedirect(req.getContextPath()+"/diary/diary.jsp?id="+id+"&gid="+gid+"&year="+currYear+"&month="+currMonth1+
			"&fisrtDay="+firstDay+"&lastDay="+lastDay+"&day="+currDay);
	}
}
