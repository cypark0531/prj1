package com.login;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;

@WebServlet("/login/idoverlapck")
public class IdoverlapckController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("id");
		
		String using=null;
		MembersDao dao=MembersDao.getIntstance();
		if(dao.idCheck(id)) {
			using="true";
		}else using="false";
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.write("<result>");
		pw.print("<using>"+using+"</using>");
		pw.print("</result>");
	}
}
