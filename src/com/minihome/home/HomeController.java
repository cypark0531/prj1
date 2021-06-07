package com.minihome.home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;
@WebServlet("/home")
public class HomeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProfilesDao dao = ProfilesDao.getInstance();
		String id = "moa1004";
		req.setAttribute("id", id);
		ArrayList<ProfilesVo> list = dao.list(id);
		//String content = (String) req.getAttribute("content");
//		String id = req.getParameter("id");
		
		
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
		System.out.println("Á¤´ä : " +psaveimg);
		
		req.setAttribute("psaveimg", psaveimg);
		req.setAttribute("ptitle", ptitle);
		req.setAttribute("htitle", htitle);
		req.setAttribute("pintro", pintro);
		
		String musicBox = (String)req.getAttribute("musicBox");
		if(musicBox==null) {
			musicBox ="/homepageframe/music.jsp";
		}
		
		
		
//		String path = "/board/boardlist.jsp";
//		System.out.println(req.getAttribute("path"));
//		if(req.getAttribute("path")!=null) {
//			path = (String) req.getAttribute("path");
//		}
//		if(content==null)	{
//			content ="/profile/insert.jsp";	
//			
//	}
	
	String cp = req.getContextPath();
	ServletContext application = getServletContext();
	application.setAttribute("cp", cp);

	//req.setAttribute("id", "test");
	//req.setAttribute("content", content);
	//req.setAttribute("path", path);
	req.setAttribute("musicBox", musicBox);
	req.getRequestDispatcher("/homepageframe/homeindex.jsp").forward(req, resp);

	

	}
}