package com.minihome.scheduler;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/scheduler/calendar")
public class CalenderController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Calendar c=null;
		String host=(String)req.getSession().getAttribute("id");
		System.out.println(host);
		//String host="test11";
		String year=req.getParameter("year");
		String month=req.getParameter("month");
		if(year!=null) {
			c=Calendar.getInstance();
			c.set(Integer.parseInt(year), Integer.parseInt(month), 1);
		}else c=Calendar.getInstance();
		
		int currYear=c.get(c.YEAR);//현재년
		int currMonth=c.get(c.MONTH);//현재월

		int lastDay=c.getActualMaximum(c.DAY_OF_MONTH);
		
		Calendar fDay =Calendar.getInstance();
		fDay.set(currYear, currMonth, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);

		ArrayList<DateAndSche> arr=new ArrayList<>();
		int day=0;
		for(int num=0;num<42;num++) {
			if(num<firstDay-1||num>firstDay+lastDay-2) {
				arr.add(new DateAndSche(num, -1, -1, null));
				continue;
			}
			day+=1;
			arr.add(new DateAndSche(num, day, 0, null));
		}
		
		
		req.setAttribute("host", host);
		req.setAttribute("year", currYear);
		req.setAttribute("month", currMonth+1);
		req.setAttribute("arr", arr);
		req.getRequestDispatcher("/scheduler/schedule").forward(req, resp);
	}
}
