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
		String id = (String)req.getSession().getAttribute("id");
		int basnum=Integer.parseInt(req.getParameter("basnum"));
		BasketDao dao =BasketDao.getInstance();
		int n=dao.delete(basnum);
		System.out.println(id);
		if(n>0) {
			req.setAttribute("id", id);
			resp.sendRedirect("../basket/basketlist?id="+id);
			//req.getRequestDispatcher("../goods/goodslist").forward(req, resp);
		}else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
		}
	}
}
