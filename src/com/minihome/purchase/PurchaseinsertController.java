package com.minihome.purchase;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.dao.PurchaseDao;
import com.minihome.vo.PurchaseVo;
@WebServlet("/purchase/insert")
public class PurchaseinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String gcode=req.getParameter("gcode");
		int gprice = Integer.parseInt(req.getParameter("gprice"));
		System.out.println(id);
		System.out.println(gprice);
		if(gprice <= MembersDao.getIntstance().getMoney(id)) {
			int b = MembersDao.getIntstance().moneyUpdate(id, gprice);
			PurchaseDao dao=PurchaseDao.getInstance();
			PurchaseVo vo=new PurchaseVo(0, id, gcode,gprice, null);
			int n=dao.PurchaseInsert(vo);
			if(n>0) {
				if(b>0) {
					req.setAttribute("id", id);
//					req.setAttribute("money", MembersDao.getIntstance().getMoney(id));
					req.getRequestDispatcher("../goods/goodslist").forward(req, resp);
					
					return;
				}else {
					req.setAttribute("code", "fail");
					req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
				}
			}
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
	}
}
