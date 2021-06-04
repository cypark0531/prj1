package com.minihome.scheduler;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ScheduleDao;
import com.minihome.vo.ScheduleVo;
@WebServlet("/scheduler/schedule")
public class ScheduleController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("id");
		
		int year=(Integer)req.getAttribute("year");
		int month=(Integer)req.getAttribute("month");
		ArrayList<DateAndSche> arr=(ArrayList<DateAndSche>)req.getAttribute("arr");
		ScheduleDao dao=ScheduleDao.getInstance();
		ArrayList<ScheduleVo> list=dao.getSchedule("test11");		
		for(DateAndSche das:arr) {
			for(ScheduleVo vo:list) {
				if(year==Integer.parseInt(vo.getSchdate().toString().substring(0, 4))&&
						month==Integer.parseInt(vo.getSchdate().toString().substring(5, 7))) {
					if(das.getDay()==Integer.parseInt(vo.getSchdate().toString().substring(10-2, 10))) {
						String text=das.getText();
						if(text==null)text="";
						Date d=vo.getSchdate();
						SimpleDateFormat sdf= new SimpleDateFormat("HH:mm ");
						text+=sdf.format(d);
						text+=vo.getSchcontent().substring(0, 2)+"..<br>";
						das.setText(text);
						
						int m=das.getScheNum()+1;
						das.setScheNum(m);
						ArrayList<ScheduleVo> l=das.getSche();
						if(l==null) l=new ArrayList<ScheduleVo>();
						l.add(vo);
						das.setSche(l);
					}
				}
					
			}
		}
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("arr", arr);
		req.getRequestDispatcher("/scheduler/scheduler.jsp").forward(req, resp);
	}
}
