package kr.co.kurly.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kurly.dao.ProductDao;
import kr.co.kurly.dto.DaeDto;
import kr.co.kurly.dto.JungDto;

@Controller
public class ProductController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/product/pwrite")
	public String pwrite(Model model)
	{
		//dae 테이블에서 대분류에 대한 내용을 읽어와서 뿌려준다
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		ArrayList<DaeDto> list=pdao.get_dae();
		ArrayList<JungDto> jlist= pdao.get_jung("01");
		model.addAttribute("list", list);
		model.addAttribute("jlist", jlist);
		return "/product/pwrite";
	}
	
	@RequestMapping("/product/get_jung")
	public void get_jung(PrintWriter out, HttpServletRequest request)
	{
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		ArrayList<JungDto> jlist= pdao.get_jung(request.getParameter("daecode"));
		String code="";
		String title="";
		for(int i=0;i<jlist.size();i++) 
		{
			code=code+jlist.get(i).getCode()+",";
			title=title+URLEncoder.encode(jlist.get(i).getTitle())+",";
		}
		out.print(code);
		out.print((title));
	}
	
}
