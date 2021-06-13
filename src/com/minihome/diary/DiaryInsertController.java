package com.minihome.diary;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.DiaryDao;
import com.minihome.vo.DiaryVo;
@WebServlet("/diary/insert")
public class DiaryInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id= (String) req.getSession().getAttribute("id");
		String gid= (String) req.getSession().getAttribute("gid");
		String dcontent = req.getParameter("dcontent");
		//int dopen = Integer.parseInt(req.getParameter("dopen"));
		
		Calendar c = Calendar.getInstance();
		int currYear=c.get(c.YEAR);//현재년
		int currMonth=c.get(c.MONTH)+1;//현재월
		int currDay= c.get(c.DAY_OF_MONTH);
		DiaryVo vo = new DiaryVo(0, id, dcontent,0, null);
		int n = DiaryDao.getInstance().insert(vo, currYear, currMonth, currDay);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/home?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
		
	}
}
