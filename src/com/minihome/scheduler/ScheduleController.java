package com.minihome.scheduler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.minihome.dao.FriendDao;
import com.minihome.dao.ScheduleDao;
import com.minihome.vo.ScheduleVo;
@WebServlet("/scheduler/schedule")
public class ScheduleController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("gid");
		
		String host=(String)req.getAttribute("host");
		int year=(Integer)req.getAttribute("year");
		int month=(Integer)req.getAttribute("month");
		ArrayList<DateAndSche> arr=(ArrayList<DateAndSche>)req.getAttribute("arr");
		ScheduleDao dao=ScheduleDao.getInstance();
		FriendDao fdao= FriendDao.getInstance();
		int rel=1;
		if(host.equals(id))rel=3;
		else if(fdao.friendOK(host, id))rel=2;
		ArrayList<Integer> list=dao.getNum(host,rel);		
		
		for(DateAndSche das:arr) {
			
			if(list!=null)for(int num:list) {
				ScheduleVo vo=dao.getSchedule(num);
				if(year==Integer.parseInt(vo.getSchdate().toString().substring(0, 4))&&
						month==Integer.parseInt(vo.getSchdate().toString().substring(5, 7))) {
					if(das.getDay()==Integer.parseInt(vo.getSchdate().toString().substring(10-2, 10))) {
						ArrayList<Integer> slist =null;
						if(das.getSche()==null) slist=new ArrayList<Integer>();
						else slist= das.getSche();
						slist.add(num);
						das.setSche(slist);
						das.setScheNum(slist.size());						
					}
				}					
			}
		}
		req.setAttribute("host", host);
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("arr", arr);
		req.getRequestDispatcher("/scheduler/scheduler.jsp?").forward(req, resp);
	}
}
