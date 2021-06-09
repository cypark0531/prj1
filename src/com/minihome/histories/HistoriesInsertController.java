package com.minihome.histories;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.HistoriesDao;
import com.minihome.vo.HistoriesVo;
@WebServlet("/histories/insert")
public class HistoriesInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String gid = req.getParameter("gid");
		String htitle = req.getParameter("htitle");
		String hcontent = req.getParameter("hcontent");
		HistoriesVo vo = new HistoriesVo(0, id, htitle, hcontent, gid, null);
		int n =HistoriesDao.getInstance().insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/histories/list?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
	
	}
}
