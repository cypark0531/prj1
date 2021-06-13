package com.minihome.basket;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BasketDao;
import com.minihome.vo.BasketVo;
@WebServlet("/basket/basketlist")
public class BasketlistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String glink=req.getParameter("glink");
		BasketDao dao=BasketDao.getInstance();
		ArrayList<BasketVo> basketlist = dao.blist(id);
		req.setAttribute("basketlist", basketlist);
		req.setAttribute("id", id);
		req.setAttribute("glink", glink);
		req.getRequestDispatcher("/basket/basketlist.jsp").forward(req, resp);
	}
}
