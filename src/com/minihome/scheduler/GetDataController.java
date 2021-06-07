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

import com.minihome.dao.ScheduleDao;
import com.minihome.vo.ScheduleVo;
@WebServlet("/scheduler/getdata")
public class GetDataController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("sche"));
		ScheduleDao dao=ScheduleDao.getInstance();
		ScheduleVo vo= dao.getSchedule(num);
		String time=vo.getSchtitle();
		String text=vo.getSchcontent();
		int open=vo.getSchopen();
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");		
			pw.print("<time>"+time+"</time>");		
			pw.print("<text>"+text+"</text>");					
			pw.print("<open>"+open+"</open>");					
		pw.print("</result>");
	}
}
