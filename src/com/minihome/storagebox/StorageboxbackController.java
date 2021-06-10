package com.minihome.storagebox;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.StorageboxDao;
import com.minihome.vo.StorageboxVo;
@WebServlet("/storageback/secect")
public class StorageboxbackController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		  String spageNum=req.getParameter("pageNum");
		  String gcategory=req.getParameter("gcategory");
		  int pageNum=1;
		  if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		  }
		  int startRow=(pageNum-1)*5+1;
		  int endRow=startRow+4;
		  StorageboxDao dao=StorageboxDao.getInstance();
		  ArrayList<StorageboxVo> sclist =dao.sclist(gcategory, startRow, endRow);
		  int pageCount=(int)Math.ceil(dao.getCount1(gcategory)/5.0);
		  //페이징 갯수
		  int startPageNum=((pageNum-1)/5*5)+1;
		  int endPageNum=startPageNum+4;
		  if(endPageNum>pageCount) {
		    endPageNum=pageCount;
		  }
		  req.setAttribute("sclist", sclist);  
		  req.setAttribute("id", id);
		  req.setAttribute("gcategory", gcategory);
		  req.setAttribute("pageCount", pageCount);
		  req.setAttribute("startPageNum", startPageNum);
		  req.setAttribute("endPageNum",endPageNum);
		  req.setAttribute("pageNum", pageNum);
		  req.getRequestDispatcher("/storagebox/storageboxbacklist.jsp").forward(req, resp);
	}
}
