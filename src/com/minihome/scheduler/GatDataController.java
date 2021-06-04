package com.minihome.scheduler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/scheduler/getdata")
public class GatDataController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int year=Integer.parseInt(req.getParameter("year"));
		int month=Integer.parseInt(req.getParameter("month"));
		
		System.out.println(year);
	}
}
