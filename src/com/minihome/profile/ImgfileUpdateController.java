package com.minihome.profile;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/profile/update")
public class ImgfileUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id =  req.getParameter("id");
			System.out.println("업데이트컨트롤러doget id:"+id);
			ProfilesDao dao = ProfilesDao.getInstance();
			ProfilesVo vo = dao.getinfoVo(id);
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/profile/profilelist(update).jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath("/homepageframe/img");
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		
		ProfilesDao dao = ProfilesDao.getInstance();
		String id = mr.getParameter("id");
		System.out.println("upatecontroller아이디"+id);
		ProfilesVo vo = dao.getinfoVo(id);
		System.out.println(vo);
		String ptitle = mr.getParameter("ptitle"); 
		String htitle = mr.getParameter("htitle");
		String porgimg = mr.getOriginalFileName("imgfile");
		String pintro = mr.getParameter("pintro");
		int popen = Integer.parseInt(mr.getParameter("popen"));
		int n = 0;
		if(porgimg!=null) {
			String psaveimg = vo.getPsavegimg();
			
			File f = new File(saveDir+"\\"+psaveimg);
			f.delete();
			String psaveImg = mr.getFilesystemName("imgfile");
			File f1 = mr.getFile("imgfile");
			ProfilesVo vo1 = new ProfilesVo(id, porgimg, psaveImg, ptitle, htitle, pintro, popen);
			n = dao.update(vo1);
		}else{
			ProfilesVo vo2 = new ProfilesVo(id, vo.getPorgimg(), vo.getPsavegimg(), ptitle, htitle, pintro, popen);
				n = dao.update(vo2);
		}
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
	}
		

}
