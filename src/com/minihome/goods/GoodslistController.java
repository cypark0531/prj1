package com.minihome.goods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GoodsDao;
import com.minihome.dao.MembersDao;
import com.minihome.vo.GoodsVo;
@ WebServlet("/goods/goodslist")
public class GoodslistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		//글 갯수
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		MembersDao dao1=MembersDao.getIntstance();
		GoodsDao dao=GoodsDao.getInstance();
		ArrayList<GoodsVo> goodslist = dao.goodslist(startRow, endRow);
		int pageCount=(int)Math.ceil(dao.getCount()/5.0);
		//페이징 갯수
		int startPageNum=((pageNum-1)/5*5)+1;
		int endPageNum=startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("goodslist", goodslist);
		req.setAttribute("money", dao1.getMoney(id));
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum",endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/goods/goodslist.jsp").forward(req, resp);
	}
}
 