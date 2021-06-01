package com.minihome.profile;

import java.io.BufferedReader;
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
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		System.out.println("업로드경로:"+saveDir);
		/*
			 private String id;
			 private String porgimg;
			 private String psavegimg;
			 private String ptitle;
			 private String hptitle;
			 private String pintro;
			 private int popen;
		 */
		String id = mr.getParameter("id"); 
		String porgimg = mr.getParameter("imgfile");
		String psaveimg = mr.getParameter("imgfile"); 
		String ptitle = mr.getParameter("ptitle");
		String htitle = mr.getParameter("htitle");
		String pintro = mr.getParameter("pintro");
		int popen = Integer.parseInt(mr.getParameter("popen"));
		System.out.println(porgimg);
		System.out.println(psaveimg);
		System.out.println(pintro);
		System.out.println();
		//db에 파일정보 저장하기
		ProfilesDao dao = ProfilesDao.getInstance();
		File f = new File(saveDir+"\\"+psaveimg);
		ProfilesVo vo  = new ProfilesVo(id, porgimg, psaveimg, ptitle, htitle, pintro, popen);
		int n = dao.insert(vo);
		
		ArrayList<ProfilesVo> list = new ArrayList<>();
		list =dao.list(id);
	//	req.setAttribute("list",list);
	//	req.getRequestDispatcher("/homepageframe/mainhomeframe.html").forward(req, resp);
		
		
		System.out.println(n);
		if(n>0) {
			req.setAttribute("code", "success");
			req.setAttribute("list",list);
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/profile/result.jsp").forward(req, resp);
	}
		

	}

