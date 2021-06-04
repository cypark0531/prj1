package com.minihome.visit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.VisitDao;
@WebServlet("/visit")
public class aa extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id= "test";
		req.setAttribute("update", VisitDao.getInstance().updateVisit(id));
		req.setAttribute("countToday", VisitDao.getInstance().countToday(id));
		req.setAttribute("countAll", VisitDao.getInstance().countAll(id));
		req.getRequestDispatcher("/visit/Footer.jsp").forward(req, resp);
	}
}
