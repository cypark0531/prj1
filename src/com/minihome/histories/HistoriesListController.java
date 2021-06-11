package com.minihome.histories;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.minihome.dao.FriendDao;
import com.minihome.dao.HistoriesDao;
import com.minihome.vo.HistoriesVo;
@WebServlet("/histories/list")
public class HistoriesListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id= "test";
		String gid= "test2";
//		String id = req.getParameter("id");
//		String gid= req.getParameter("gid");
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum= Integer.parseInt(spageNum);
		}
		
		int startRow= (pageNum-1)*3+1;
		int endRow= startRow+2;
		ArrayList<HistoriesVo> list = HistoriesDao.getInstance().list(id,startRow,endRow);
		
		int pageCount=(int)Math.ceil(HistoriesDao.getInstance().getCount(id)/3.0);//전체 페이지 갯수 구하기

		System.out.println("pageCount : " + pageCount);
		int startPageNum = ((pageNum-1)/4*4)+1;
		System.out.println("startPageNum :" + startPageNum);
		int endPageNum= startPageNum+3;
		System.out.println("endPageNum :" + endPageNum);
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
			boolean friend = FriendDao.getInstance().friendOK(id, gid);
		req.setAttribute("friend", friend);
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/histories/list.jsp").forward(req, resp);
		


		
	}
}
