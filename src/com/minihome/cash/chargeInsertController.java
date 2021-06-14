package com.minihome.cash;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
@WebServlet("/charge/insert")
public class chargeInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String gid = (String)req.getSession().getAttribute("gid");
		String scash = req.getParameter("cash");
		int cash = 0;
		if(scash.equals("another")) {
			cash =  Integer.parseInt(req.getParameter("another"))/100;
		}else {
			cash = Integer.parseInt(req.getParameter("cash"));
		}
		int n = MembersDao.getIntstance().moneyRefund(id, cash);
		if(n>0) {
		}else {
			System.out.println("실패");
		}
		resp.sendRedirect(req.getContextPath()+"/home");
	}
}
