package com.minihome.home;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GalleryDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.vo.GalleryVo;
import com.minihome.vo.ProfilesVo;
@WebServlet("/home")
public class HomeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProfilesDao dao = ProfilesDao.getInstance();
		String id = "test";
		String gid = "test";
		req.setAttribute("id", id);
		req.setAttribute("gid", gid);
		
		//Profiles 프로필
		ArrayList<ProfilesVo> list = dao.list(id);
		if(list.size()<1) {
			req.setAttribute("profile", 1);
		}else {
			req.setAttribute("profile",2);
		}
		String psaveimg = null;
		String ptitle = null;
		String pintro = null;
		String htitle = null;
		for(ProfilesVo vo :list) {
			psaveimg = vo.getPsavegimg();	
			ptitle = vo.getPtitle();
			htitle = vo.getHtitle();
			pintro = vo.getPintro();
			
		}
		System.out.println("占쏙옙占쏙옙 : " +psaveimg);
		
		req.setAttribute("list", list);
		req.setAttribute("psaveimg", psaveimg);
		req.setAttribute("ptitle", ptitle);
		req.setAttribute("htitle", htitle);
		req.setAttribute("pintro", pintro);
		
		
		
		String musicBox = (String)req.getAttribute("musicBox");
		if(musicBox==null) {
			musicBox ="/homepageframe/music.jsp";
		}
		
		
		//Dairy 다이어리
		String dPath = getDiary(req, resp);
		//String dPath = "/diary/main?id=test&gid=test";
//		System.out.println("path" + req.getParameter("path"));
		if(req.getParameter("dPath")!=null) {
			dPath = (String) req.getParameter("dPath");
			dPath += "?id="+ req.getParameter("id")+ "&gid="+req.getParameter("gid");
			
		}
		req.setAttribute("dPath", dPath);
//		if(content==null)	{
//			content ="/profile/insert.jsp";	
//			
//	}	
//		String id = "test4";
		GalleryVo gvo  = GalleryDao.getInstance().getRecent(id);
		req.setAttribute("gvo", gvo);
		System.out.println("galcontent : "+gvo.getGalcontent());
		String galtitle = gvo.getGaltitle();
		String galcontent = gvo.getGalcontent();
		String galsavename = gvo.getGalsavename();
		Date regdate = gvo.getRegdate();
		
		req.setAttribute("galtitle",galtitle);
		req.setAttribute("galcontent", galcontent);
		req.setAttribute("galsavename", galsavename);
		req.setAttribute("regdate", regdate);
		
	System.out.println(dPath);
	String cp = req.getContextPath();
	ServletContext application = getServletContext();
	application.setAttribute("cp", cp);
	//req.setAttribute("id", "test");
	//req.setAttribute("gid", "test1");
	//req.setAttribute("content", content);
	//req.setAttribute("path", path);
	req.setAttribute("musicBox", musicBox);
	req.getRequestDispatcher("/homepageframe/homeindex.jsp").forward(req, resp);

	

	}
	public String getDiary(HttpServletRequest req, HttpServletResponse resp) {
		Calendar c=null;
//		String id= req.getParameter("id");
		String id= "test";
//		String gid= req.getParameter("gid");
		String gid = "test";
		String year=(String)req.getParameter("year");
		String month=(String)req.getParameter("month");
		if(year!=null) {
		c=Calendar.getInstance();
		c.set(Integer.parseInt(year), Integer.parseInt(month)-1, 1);
		}else c=Calendar.getInstance();
		int currYear=c.get(c.YEAR);//�쁽�옱�뀈
		int currMonth=c.get(c.MONTH)+1;//�쁽�옱�썡
		int currDay= c.get(c.DAY_OF_MONTH);
		int lastDay=c.getActualMaximum(c.DAY_OF_MONTH);
		Calendar fDay =Calendar.getInstance();
		fDay.set(currYear, currMonth, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);
		
		Calendar cc =Calendar.getInstance();
		int realYear = cc.get(c.YEAR);
			String path = "/diary/diary.jsp?id="+id+"&gid="+gid+"&year="+currYear+"&month="+currMonth+
					"&firstDay="+firstDay+"&lastDay="+lastDay+"&day="+currDay+"&realYear="+realYear;
			return path;
	}
	
	
}