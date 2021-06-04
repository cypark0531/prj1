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
		PurchaseDao dao=PurchaseDao.getInstance();
		PurchaseVo vo=new PurchaseVo(0, id, gcode, null);
		int gprice = Integer.parseInt(req.getParameter("gprice"));
		if(gprice > MembersDao.getIntstance().getMoney(id)) {
			int n = MembersDao.getIntstance().moneyUpdate(id, gprice);
			if(n>0) {
				
			}else {
				req.getRequestDispatcher("/goods/goodsresult.jsp?fail=1").forward(req, resp);
			}
		}
		
		int n=dao.PurchaseInsert(vo);
		if(n>0) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
	}
}
