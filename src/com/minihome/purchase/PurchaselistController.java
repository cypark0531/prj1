package com.minihome.purchase;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.PurchaseDao;
import com.minihome.vo.PurchaseVo;
@WebServlet("/purchase/purchaselist")
public class PurchaselistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		System.out.println(id);
		PurchaseDao dao=PurchaseDao.getInstance();
		ArrayList<PurchaseVo> list=dao.list(id);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/purchase/purchaselist.jsp").forward(req, resp);
	}
}
