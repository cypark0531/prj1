package com.minihome.purchase;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.dao.PurchaseDao;
import com.minihome.dao.RefundDao;
import com.minihome.vo.PurchaseVo;
import com.minihome.vo.RefundVo;
@WebServlet("/purchase/delete")
public class PurchasedeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		int purnum=Integer.parseInt(req.getParameter("purnum"));
		String gcode=req.getParameter("gcode");
		int gprice = Integer.parseInt(req.getParameter("gprice"));
		System.out.println(gprice);
		//환불목록에 추가
		RefundVo vo=new RefundVo(0, id, gcode, 0, purnum, null);
		RefundDao dao= RefundDao.getInstance();
//		System.out.println(id);
//		System.out.println(purnum);
//		System.out.println(gcode);
//		System.out.println(gprice);
		int n=dao.RefundInsert(vo);
		if(n>0) {
			MembersDao.getIntstance().getMoney(id);//돈 조회
			MembersDao.getIntstance().moneyRefund(id, gprice);//환불
			req.setAttribute("code", "success");
			req.setAttribute("gprice", gprice);
			req.getRequestDispatcher("/goods/goodslist").forward(req, resp);
		}else {
			System.out.println("실패");
		}
		
//		MembersDao.getIntstance().getMoney(id);//돈 조회
//		int b = MembersDao.getIntstance().moneyRefund(id, gprice);//환불
//		if(b>0) {
//			PurchaseDao.getInstance().PurchaseDelete(purnum);
//			resp.sendRedirect(req.getContextPath()+"/goods/goodsmain.jsp");
//			return;
//		}else {
//			req.setAttribute("code", "fail");
//			req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
//		}
//				int c=PurchaseDao.getInstance().PurchaseDelete(id);
//				if(c>0) {
//					resp.sendRedirect("../purchase/purchaselist.jsp");
//				}else {
//					System.out.println("실패");
//				}
//				req.setAttribute("delete", n1);
//				req.getRequestDispatcher("").forward(req, resp);
				
	}

}
