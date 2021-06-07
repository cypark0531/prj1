package com.minihome.scheduler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ScheduleDao;
import com.minihome.vo.ScheduleVo;
@WebServlet("/scheduler/setdata")
public class SetDataController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int schnum=Integer.parseInt(req.getParameter("schnum"));
		String id=req.getParameter("id");
		String schcontent=req.getParameter("schcontent");
		int schopen=Integer.parseInt(req.getParameter("schopen"));
		String d=req.getParameter("schdate");
		String schtitle=d.split(",")[1];
		Date schdate=null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
        try {
            java.util.Date utildate = format.parse(d.split(",")[0]);
            schdate=new Date(utildate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(schnum+" "+ id+" "+ schtitle+" "+ schcontent+" "+ schopen+" "+ schdate); 
		ScheduleDao dao=ScheduleDao.getInstance();
		ScheduleVo vo= new ScheduleVo(schnum, id, schtitle, schcontent, schopen, schdate);
		int n=dao.setSchedule(vo);
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");		
			if(n>0)pw.print("<code>success</code>");		
			else pw.print("<code>fail</code>");						
		pw.print("</result>");
	}
}
