package com.minihome.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BasketDao;
@WebServlet("/basket/delete")
public class BasketdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int basnum=Integer.parseInt(req.getParameter("basnum"));
		int n=BasketDao.getInstance().delete(basnum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/basket/basketlist.jsp");
			return;
		}else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
		}
	}
}
