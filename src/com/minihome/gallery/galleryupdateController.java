package com.minihome.gallery;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GalleryDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.vo.GalleryVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/gallery/update")
public class galleryupdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int galnum = Integer.parseInt(req.getParameter("galnum"));
		GalleryDao dao = GalleryDao.getInstance();
		GalleryVo vo = dao.getinfoVo(galnum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/gallery/update.jsp;").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath("/homepagefram/gimg");
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		
		int galnum = Integer.parseInt(req.getParameter("galnum"));
		GalleryDao dao = GalleryDao.getInstance();
		
		GalleryVo vo = dao.getinfoVo(galnum);
		
		String id = mr.getParameter("id");
		String galtitle = mr.getParameter("galtitle");
		String galorgname = mr.getOriginalFileName("imgfile");
		String galcontent = mr.getFilesystemName("galcontent");
		int galopen = Integer.parseInt(mr.getParameter("galopen"));
	//	String regdate = mr.getParameter("regdate");
		int n = 0;
		if(galorgname!=null) {
			String galsavename = vo.getGalsavename();
			
			File f = new File(saveDir+"\\"+galsavename);
			f.delete();
			String galsaveName = mr.getFilesystemName("imgfile");
			File f1 = mr.getFile("imgfile");
			//public GalleryVo(int galnum, String id, String galtitle, String galcontent, String galorgname, String galsavename,
			//int galopen, Date regdate)
			
			GalleryVo vo1 = new GalleryVo(galnum,id,galtitle,galcontent,galorgname, galsavename, galopen,null);
			//GalleryVo vo1 = new GalleryVo(galnum,id,galtitle, vo.getGalorgname(), vo.getGalsavename() , galopen, regdate);	
				
		}else {
				
		}
		resp.sendRedirect(req.getContextPath()+"/gallery/list.jsp?id="+id+"gid");//gid);
		
		
		
	}
	
	
}
