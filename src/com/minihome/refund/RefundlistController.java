package com.minihome.refund;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.RefundDao;
import com.minihome.vo.RefundVo;
@WebServlet("/refund/refundlist")
public class RefundlistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		System.out.println(id);
		RefundDao dao=RefundDao.getInstance();
		ArrayList<RefundVo> vo=dao.list(id);
		req.setAttribute("refundlist", vo);
		req.getRequestDispatcher("/refund/refundlist.jsp").forward(req, resp);
	}
}
