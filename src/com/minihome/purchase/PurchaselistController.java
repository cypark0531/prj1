package com.minihome.purchase;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.PurchaseDao;
import com.minihome.dao.RefundDao;
import com.minihome.vo.PurchaseVo;
import com.minihome.vo.RefundVo;
@WebServlet("/purchase/purchaselist")
public class PurchaselistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		ArrayList<RefundVo> relist = RefundDao.getInstance().list(id);
		//글 갯수
		int startRow=(pageNum-1)*8+1;
		int endRow=startRow+7;
		PurchaseDao dao=PurchaseDao.getInstance();
		ArrayList<PurchaseVo> list=dao.list(id, startRow, endRow);
		int pageCount=(int)Math.ceil(dao.getCount(id)/8.0);
		//페이징 갯수
		int startPageNum=((pageNum-1)/5*5)+1;
		int endPageNum=startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("relist", relist);
		req.setAttribute("list", list);
	    req.setAttribute("id", id);
	    req.setAttribute("pageCount", pageCount);
	    req.setAttribute("startPageNum", startPageNum);
	    req.setAttribute("endPageNum",endPageNum);
	    req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/purchase/purchaselist.jsp").forward(req, resp);
	}
}
