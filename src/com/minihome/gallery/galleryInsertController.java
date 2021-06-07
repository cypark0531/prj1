package com.minihome.gallery;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.minihome.dao.GalleryDao;
import com.minihome.vo.GalleryVo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
	@WebServlet("/gallery/insert")
public class galleryInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath("/homepageframe/gimg");
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		System.out.println("업로드경로:"+saveDir);
		
		/*
		private int galnum;
		private String id;
		private String galtitle;
		private String galcontent;
		private String galorgname;
		private String galsavename;
		private int galopen;
		private Date regdate;
		 */
		//int galnum = Integer.parseInt(mr.getParameter("galnum"));
		String id = mr.getParameter("id");
		String galtitle = mr.getParameter("galtitle");
		String galcontent = mr.getParameter("galcontent");
		String galorgname = mr.getOriginalFileName("imgfile");
		String galsavename = mr.getFilesystemName("imgfile");
		int galopen = Integer.parseInt(mr.getParameter("galopen"));
		
		System.out.println("id");
		System.out.println("galtitle");
		System.out.println("galcontent");
		System.out.println("galorgname");
		System.out.println("galsavename");
		System.out.println("galopen");
		GalleryVo vo = new GalleryVo(0, id, galtitle, galcontent, galorgname, galsavename, galopen, null);
		GalleryDao dao = GalleryDao.getInstance();
		int n = dao.insert(vo);
		File f = new File(saveDir+"\\"+galsavename);
		if(n>0) {
			
				req.setAttribute("code", "alert('등록을 정상적으로 완료하였습니다.');");
				req.getRequestDispatcher("/gallery/result.jsp").forward(req, resp);
		}else {
				req.setAttribute("code", "alert('등록을 실패아였습니다.');");
				req.getRequestDispatcher("/gallery/insert.jsp").forward(req, resp);
		}
//		req.getRequestDispatcher("/home").forward(req, resp);
		
		
		
		
		
		
	}
	
	
}
