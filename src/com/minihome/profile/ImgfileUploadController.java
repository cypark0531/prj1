package com.minihome.profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImgfileUploadController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		System.out.println("���ε���:"+saveDir);
		String ptitle = mr.getParameter("ptitle"); 
		String htitle = mr.getParameter("htitle");
		String prointro = mr.getParameter("prointro");
		String porgimg= mr.getOriginalFileName("imgfile");//���۵� ���ϸ�  insert.jsp�� �ִ� �̸��̶��Ȱ���������Ѵ�
		String psaveimg = mr.getFilesystemName("imgfile");
		

	}
}
