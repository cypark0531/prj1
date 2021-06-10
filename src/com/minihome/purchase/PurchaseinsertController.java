package com.minihome.purchase;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.dao.PurchaseDao;
import com.minihome.dao.StorageboxDao;
import com.minihome.vo.PurchaseVo;
import com.minihome.vo.StorageboxVo;
@WebServlet("/purchase/insert")
public class PurchaseinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String gcode=req.getParameter("gcode");
		String glink=req.getParameter("glink");
		int gprice = Integer.parseInt(req.getParameter("gprice"));
		String gsaveimg= req.getParameter("gsaveimg");
		String gorgimg= req.getParameter("gsaveimg");
		String gname= req.getParameter("gname");
		String gcategory= req.getParameter("gcategory");
		System.out.println(id);
		System.out.println(gprice);
		if(gprice <= MembersDao.getIntstance().getMoney(id)) {
			//구매목록추가
			PurchaseDao dao=PurchaseDao.getInstance();
			PurchaseVo vo=new PurchaseVo(0, id, gcode,gprice, null);
			int n=dao.PurchaseInsert(vo);
			//보관함 추가
			StorageboxDao dao1=StorageboxDao.getInstance();
			StorageboxVo vo2=new StorageboxVo(0, id, gcode, glink, gsaveimg, gorgimg, gname, gcategory);
			int c=dao1.storageinsert(vo2);
			//회원 돈 업데이트
			int b=MembersDao.getIntstance().moneyUpdate(id, gprice);
			if(n>0) {
				if(b>0) {
					if(c>0) {
						req.setAttribute("id", id);
						req.setAttribute("glink", glink);
						req.setAttribute("gcode", gcode);
						req.setAttribute("gsaveimg", gsaveimg);
						req.setAttribute("gorgimg", gorgimg);
						req.setAttribute("gname", gname);
						req.setAttribute("gcategory", gcategory);
//						req.setAttribute("money", MembersDao.getIntstance().getMoney(id));
						req.getRequestDispatcher("../goods/goodslist").forward(req, resp);
					}
				}else {
					req.setAttribute("code", "fail");
					req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
				}
			}
		}else {
			req.setAttribute("code", "fail");
		}
	}
}
