package com.goods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GoodsDao;
import com.minihome.vo.GoodsVo;
@ WebServlet("/goods/goodslist")
public class GoodslistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GoodsDao dao=GoodsDao.getInstance();
		ArrayList<GoodsVo> goodslist=dao.goodslist();
		req.setAttribute("goodslist", goodslist);
		req.getRequestDispatcher("/goods/goodslist.jsp").forward(req, resp);
	}
}
