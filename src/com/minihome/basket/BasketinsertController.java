package com.minihome.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BasketDao;
import com.minihome.vo.BasketVo;
@WebServlet("/basket/insert")
public class BasketinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String gcode=req.getParameter("gcode");
		int gprice=Integer.parseInt(req.getParameter("gprice"));
		System.out.println(gprice);
		String gname=req.getParameter("gname");
		String gorgimg=req.getParameter("gsaveimg");
		String gsaveimg=req.getParameter("gsaveimg");
		BasketDao dao=BasketDao.getInstance();
		BasketVo vo=new BasketVo(0, id, gcode, gprice, gname, gsaveimg, gorgimg);
		int n=dao.binsert(vo);
		if(n>0) {
		  	req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
		}
	}
}
