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
@WebServlet("/storagebox/storageboxlist")
public class StorageboxlistController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String glink=req.getParameter("glink");
		String spageNum=req.getParameter("pageNum");
		System.out.println("Fdsfdsfsdfds="+glink);
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		//글 갯수
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		StorageboxDao dao=StorageboxDao.getInstance();
		
		ArrayList<StorageboxVo> storageboxlist = dao.storagelist(id,startRow, endRow);
		int pageCount=(int)Math.ceil(dao.getCount()/5.0);
		//페이징 갯수
		int startPageNum=((pageNum-1)/5*5)+1;
		int endPageNum=startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("storageboxlist", storageboxlist);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum",endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("glink", glink);
		req.setAttribute("id", id);
		req.getRequestDispatcher("/storagebox/storageboxlist.jsp").forward(req, resp);
	}
}
