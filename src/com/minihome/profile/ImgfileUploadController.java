package com.minihome.profile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/profile/upload")
public class ImgfileUploadController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath("/homepageframe/img");
		System.out.println(saveDir);
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		System.out.println("���ε���:"+saveDir);
		/*
			 private String id;
			 private String porgimg;
			 private String psavegimg;
			 private String ptitle;
			 private String hptitle;
			 private String pintro;
			 private int popen;
		 */
		String id = (String) req.getSession().getAttribute("id");
		String gid = (String) req.getSession().getAttribute("gid");
		String porgimg = mr.getOriginalFileName("imgfile");
		String psaveimg = mr.getFilesystemName("imgfile"); 
		String ptitle = mr.getParameter("ptitle");
		String htitle = mr.getParameter("htitle");
		String pintro = mr.getParameter("pintro");
		int popen = Integer.parseInt(mr.getParameter("popen"));
		
		
		System.out.println(porgimg);
		System.out.println(psaveimg);
		System.out.println(ptitle);
		System.out.println(htitle);
		System.out.println(pintro);
		System.out.println(popen);
		//db�� �������� �����ϱ�
		ProfilesDao dao = ProfilesDao.getInstance();
		File f = new File(saveDir+"\\"+psaveimg);
		
		ProfilesVo vo  = new ProfilesVo(id, porgimg, psaveimg, ptitle, htitle, pintro, popen);
		int n = dao.insert(vo);
		
		ArrayList<ProfilesVo> list = new ArrayList<>();
		list =dao.list(id);
	//	req.setAttribute("list",list);
	//	req.getRequestDispatcher("/homepageframe/mainhomeframe.html").forward(req, resp);
		
		req.setAttribute("list",list);

		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/home?id="+id+"&gid="+gid);
			
		}else {
			System.out.println("����!");
		}
	
	}
		

	}

