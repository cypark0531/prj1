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

import com.minihome.dao.BasicSettingDao;
import com.minihome.dao.FriendDao;
import com.minihome.dao.GalleryDao;
import com.minihome.dao.GoodsDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.dao.VisitDao;

import com.minihome.dao.PurchaseDao;
import com.minihome.dao.StorageboxDao;

import com.minihome.vo.GalleryVo;
import com.minihome.vo.GoodsVo;
import com.minihome.vo.ProfilesVo;
import com.minihome.vo.StorageboxVo;
@WebServlet("/home")
public class HomeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("gid");
		if(req.getParameter("id")!=null)id =req.getParameter("id");
		String gid = (String)req.getSession().getAttribute("gid");
		req.getSession().setAttribute("id", id);
		String gcategory=req.getParameter("gcategory");
		String gsaveimg=req.getParameter("gsaveimg");
		int anum=0;
		if(req.getParameter("anum")!=null)anum=Integer.parseInt(req.getParameter("anum"));
		System.out.println("이미지 파일명23432="+gsaveimg);
		req.setAttribute("gsaveimg", gsaveimg);
		//req.setAttribute("gid", gid);
		
		
		//Visit
			boolean exist = VisitDao.getInstance().existToday(id);
			System.out.println(exist);
		if(exist==false) {
			VisitDao.getInstance().insert(id);
		}
		if(gid!=id) {
			VisitDao.getInstance().updateVisit(id);
		}
		int today = VisitDao.getInstance().countToday(id);
		int allday = VisitDao.getInstance().countAll(id);
		
		req.setAttribute("today", today);
		req.setAttribute("allday", allday);
		
		
		
		
//		if(StorageboxDao.getInstance().findanum(id)!=-1) {
//			anum = StorageboxDao.getInstance().findanum(id);
//			System.out.println("fdsfsd=="+anum);
//			}else {
//				StorageboxDao.getInstance().musicdefault(id);
//			}
		StorageboxDao dao00=StorageboxDao.getInstance();
		int n=dao00.update2(anum);
		if(n>0) {
			dao00.update1(anum, dao00.findc(anum));
		}
		System.out.println(n);
		req.setAttribute("apply", anum);
		StorageboxVo backvo=dao00.findback(id);
		GoodsDao dao01=GoodsDao.getInstance();
		StorageboxVo musicvo=dao00.findmusic(id);
		if(musicvo !=null) {
			req.setAttribute("gname", musicvo.getGname());
			String gcodelist=dao01.gcodelist(musicvo.getGcode());
			req.setAttribute("gcodelist", gcodelist);
			System.out.println(musicvo);
			System.out.println("Fdsfdsfdsfsd="+gcodelist);
		}
		if(backvo !=null) {
			req.setAttribute("backvo", backvo);
		}
		
		
		
		
		//백그라운드
//		GoodsDao dao0= GoodsDao.getInstance();
//		ArrayList<GoodsVo> gclist=dao0.gcList("background");
//		String gsaveimg=null;
//		for(GoodsVo vo: gclist) {
//			gsaveimg = vo.getGsaveimg();
//			System.out.println("이미지 파일명321321312  "+gsaveimg);
//		}
//		req.setAttribute("gclist", gclist);
//		req.setAttribute("gsaveimg", gsaveimg);
		
		
		//Profiles 프로필
		ProfilesDao dao = ProfilesDao.getInstance();
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
		System.out.println("파일명 : " +psaveimg);
		 
		req.setAttribute("list", list);
		req.setAttribute("psaveimg", psaveimg);
		req.setAttribute("ptitle", ptitle);
		req.setAttribute("htitle", htitle);
		req.setAttribute("pintro", pintro);
				
		//일촌 목록
				FriendDao fridao=FriendDao.getInstance();
				ArrayList<String> frilist=fridao.getFriend(id);
				ArrayList<String[]> friendlist=new ArrayList<String[]>();
				if(frilist!=null)for(String hostid:frilist) {
					String[] str= {hostid,"home?id="+hostid}; 
					friendlist.add(str);
				}
				else {
					String[] str= {"-","-"}; 
					friendlist.add(str);
				}
				req.setAttribute("friendlist", friendlist);
		
		
		String musicBox = (String)req.getAttribute("musicBox");
		if(musicBox==null) {
		   musicBox ="/homepageframe/music.jsp";
		}
		
		
		//Dairy 다이어리
		//String dPath = "/diary/main?id=test&gid=test";
//		System.out.println("path" + req.getParameter("path"));
		
//		if(content==null)	{
//			content ="/profile/insert.jsp";	
//			
//	}	
		GalleryVo gvo  = GalleryDao.getInstance().getRecent(id);
		if(gvo==null) {
			gvo = new GalleryVo(0, "test", "The Photo Dosen't Not Exist",  "If u  Want To Upload Your photo Please Click 'REGISTER'!",  "none",  "none", 0, null);
		}
		req.setAttribute("gvo", gvo);
		System.out.println(gvo);
		
		
	
		
	String dPath = getDiary(req, resp);
	req.setAttribute("dPath", dPath);
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
		String year=(String)req.getParameter("year");
		String month=(String)req.getParameter("month");
		if(year!=null) {
		c=Calendar.getInstance();
		c.set(Integer.parseInt(year), Integer.parseInt(month)-1, 1);
		}else c=Calendar.getInstance();
		int currYear=c.get(c.YEAR);
		int currMonth=c.get(c.MONTH)+1;
		int currDay= c.get(c.DAY_OF_MONTH);
		int lastDay=c.getActualMaximum(c.DAY_OF_MONTH);
		Calendar fDay =Calendar.getInstance();
		fDay.set(currYear, currMonth, 1);
		int firstDay=fDay.get(fDay.DAY_OF_WEEK);
		Calendar cc =Calendar.getInstance();
		int realYear = cc.get(c.YEAR);
			String path = "/diary/diary.jsp?year="+currYear+"&month="+currMonth+
					"&firstDay="+firstDay+"&lastDay="+lastDay+"&day="+currDay+"&realYear="+realYear;
			return path;
	}
}
