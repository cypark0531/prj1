package com.minihome.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GoodsDao;
import com.minihome.dao.MembersDao;
import com.minihome.db.MyDBCP;
@ WebServlet("/goods/goodslist")
public class GoodslistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GoodsDao dao=GoodsDao.getInstance();
		req.setAttribute("goodslist", dao.goodslist());
		//겟머니 해주시고
		//파라매터 넘겨서
		req.getRequestDispatcher("/goods/goodslist.jsp").forward(req, resp);
	}
}