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
@WebServlet("/scheduler/calender")
public class CalenderController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Calendar c=Calendar.getInstance();
		int currYear=c.get(c.YEAR);
		int currMonth=c.get(c.MONTH);
		int currDay=c.get(c.DATE);
		int lastDay=c.getActualMaximum(c.DAY_OF_MONTH);
		Calendar fDay =Calendar.getInstance();
		fDay.set(currYear, currMonth, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);

		ArrayList<DateAndSche> arr=new ArrayList<>();
		int day=0;
		for(int num=0;num<42;num++) {
			if(num<firstDay-1||num>firstDay+lastDay-2) {
				arr.add(new DateAndSche(num, -1, null));
				continue;
			}
			day+=1;
			arr.add(new DateAndSche(num, day, null));
		}
		
		
		req.setAttribute("year", currYear);
		req.setAttribute("month", currMonth+1);
		req.setAttribute("arr", arr);
		req.getRequestDispatcher("/scheduler/scheduler.jsp").forward(req, resp);
	}
}