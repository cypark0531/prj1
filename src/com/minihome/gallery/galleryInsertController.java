package com.minihome.gallery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String galnum = mr.getParameter("galnum");
		String id = mr.getParameter("id");
		String galtitle = mr.getParameter("galtitle");
		String galcontent = mr.getParameter("galcontent");
		String galorgname = mr.getParameter("galsavename");
		int galopen = Integer.parseInt(mr.getParameter("galopen"));
		
	
	}
	
	
}
