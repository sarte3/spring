package kr.co.kurly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kurly.dao.ProductDao;
import kr.co.kurly.dto.DaeDto;
import kr.co.kurly.dto.JungDto;
import kr.co.kurly.dto.ProductDto;

@Controller
public class ProductController {
	@Autowired
	public  SqlSession sqlSession; 
	
	@RequestMapping("/product/pwrite")
	public String pwrite(Model model)
	{
		// dae테이블에서 대분류에대한 내용을 읽어와서 뿌려준다..
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		ArrayList<DaeDto> list=pdao.get_dae();
		ArrayList<JungDto> jlist=pdao.get_jung("01");
		model.addAttribute("list",list);
		model.addAttribute("jlist",jlist);
		return "/product/pwrite";
	}
	
	@RequestMapping("/product/get_jung")
	public void get_jung(HttpServletRequest request,PrintWriter out)
	{
		String daecode=request.getParameter("daecode");
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		ArrayList<JungDto> jlist=pdao.get_jung(daecode);
		String code="";
		String title="";
		for(int i=0;i<jlist.size();i++)
		{
			code=code+jlist.get(i).getCode()+",";
			title=title+URLEncoder.encode(jlist.get(i).getTitle())+",";
		}
		out.print(code);
		out.print(title);
	}
	
	@RequestMapping("/product/pwrite_ok")
	public String pwrite_ok(HttpServletRequest request,ProductDto pdto) throws IOException
	{
		String path=request.getRealPath("resources/pimg");
		int max=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		// 상품코드 완성하기
		
		String pcode=multi.getParameter("pcode");
		Integer num=pdao.get_maxpcode(pcode);
		num++;
		String num2=num.toString();
		switch(num2.length())
		{
		  case 1: num2="000"+num2; break;
		  case 2: num2="00"+num2; break;
		  case 3: num2="0"+num2; break;
		}
		
		pcode=pcode+num2;
		// request된 값을 dto클래스에 setter하기
		pdto.setPcode(pcode);
		pdto.setTitle(multi.getParameter("title"));
		pdto.setSubtitle(multi.getParameter("subtitle"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		pdto.setPdan(multi.getParameter("pdan"));
		pdto.setPwe(multi.getParameter("pwe"));
		pdto.setBgubun(Integer.parseInt(multi.getParameter("bgubun")));
		pdto.setMade(multi.getParameter("made"));
		pdto.setPal(multi.getParameter("pal"));
		pdto.setGihan(Integer.parseInt(multi.getParameter("gihan")));
		pdto.setSu(Integer.parseInt(multi.getParameter("su")));
		pdto.setHalin(Integer.parseInt(multi.getParameter("halin")));
		pdto.setMimg(multi.getFilesystemName("mimg")); // 실제 저장되는 이름
		pdto.setPcon(multi.getFilesystemName("pcon"));
		pdto.setPimg(multi.getFilesystemName("pimg"));
		pdto.setPinfo(multi.getFilesystemName("pinfo"));
		 
		pdao.pwrite_ok(pdto);
		
		return "redirect:/product/pwrite";
	}
	
	@RequestMapping("/product/pro_list")
	public String pro_list(Model model,HttpServletRequest request)
	{
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
        String pcode=request.getParameter("pcode");
        ArrayList<ProductDto> list=pdao.get_pro_list(pcode);
        model.addAttribute("list",list);
		return "/product/pro_list";
	}
	
	@RequestMapping("/product/pro_content")
	public String pro_content(HttpServletRequest request, Model model)
	{
		String pcode=request.getParameter("pcode");
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		ProductDto pdto=pdao.get_pro_content(pcode);
		model.addAttribute("pdto", pdto);
	
		return "/product/pro_content";
	}
}












