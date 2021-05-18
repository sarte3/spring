package com.finshot.web;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finshot.web.dto.EmpDto;
import com.finshot.web.dto.IdsDto;


@Controller
public class EmpController {

	@Autowired
	private EmpService service;
	
	@RequestMapping("/write")
	public String write()
	{
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(EmpDto dto)
	{
		service.write(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest req)
	{
		String category;
		String word;
		
		int mount=10;
		
		if(req.getParameter("mount")!=null) {
			mount=Integer.parseInt(req.getParameter("mount"));
		}
		
		if(req.getParameter("category")==null) 
		{
			category="eno";
			word="";
		}
		else
		{
			category=req.getParameter("category"); 
			word=req.getParameter("word"); 
		}
		
		int page, index;
		if(req.getParameter("page")==null)
		{
			index=0;
			page=1;
		}
		else
		{
			page=Integer.parseInt(req.getParameter("page"));
			index=(page-1)*10;
		}

		int pstart=page/10;
		if(page%10 ==0)
			pstart = pstart-1;
		pstart = (pstart*10)+1;
		int pend=pstart+9;
		int chong=service.getTotal(category, word);
		int page_cnt=chong/10;
		
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;

		System.out.println(category);
		System.out.println(word);
		ArrayList<EmpDto> list=service.list(category, word, mount, index);
		model.addAttribute("list", list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("word",word);
		model.addAttribute("chong", chong);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	
	@RequestMapping("/content")
	public String content(Model model, HttpServletRequest req)
	{
		EmpDto dto = service.content(req.getParameter("id"));
		
		model.addAttribute("dto", dto);
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(Model model, HttpServletRequest req)
	{
		EmpDto dto = service.content(req.getParameter("id"));
		
		model.addAttribute("dto", dto);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(EmpDto dto)
	{
		service.update(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req, IdsDto dto)
	{
		String ids = req.getParameter("ids");
		
		String[] idsArray=ids.split(",");
		
		ids="";
		
		for(int i=0;i<idsArray.length;i++) {
			
			if(i==(idsArray.length-1)) {
				ids+="\'"+idsArray[i]+"\'";
			}
			else {
				ids+="\'"+idsArray[i]+"\',";
			}
		}
		
		dto.setIds(ids);
		
		service.delete(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/ajax_chk")
	public void ajax_cal(HttpServletRequest req, PrintWriter out) throws UnsupportedEncodingException
	{
		String eno= req.getParameter("eno");
		
		int chk = service.checkEno(eno);
				
		out.print(chk);
		
	}
}
