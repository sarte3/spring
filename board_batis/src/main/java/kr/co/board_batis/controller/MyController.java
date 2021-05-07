package kr.co.board_batis.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_batis.dao.Dao;
import kr.co.board_batis.dto.Dto;

@Controller
public class MyController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home() 
	{
		return "redirect/list";
	}
	
	@RequestMapping("/write")
	public String write() 
	{
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(Dto dto) 
	{
		Dao dao=sqlSession.getMapper(Dao.class);
		dao.write_ok(dto);
		//		String name=dto.getName();
		//		String title=dto.getTitle();
		//		for(int i=1;i<=2578;i++) 
		//		{
		//			dto.setName(name+i);
		//			dto.setTitle(title+i);
		//			dao.write_ok(dto);
		//		}
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request)
	{
		Dao dao=sqlSession.getMapper(Dao.class);
		
		// list 메소드에 보낼 index 값을 구해야 된다
		// 사용자가 원하는 페이지에 따라 index 값은 바뀐다
		
		// 1 페이지 -> 0-9, 2페이지 10-19
		// 사용자가 페이지 값을 요청하지 않는 경우
		
		int page, index;

		if(request.getParameter("page")==null) 
		{
			page=1;
			index=0;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
			index=(page-1)*10;			
		}
		
		// pstart, pend 구하기
		int pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		// 총페이지 수를 구해서 전달 => 마지막 페이지
		int cnt=dao.getPageCnt();
		int pageCnt=cnt/10;
		
		if(cnt%10 != 0) 
			pageCnt++;
		
		
		if(pend>pageCnt)
			pend=pageCnt;
		
		//view에 사용자가 원하는 페이지를 클릭할 수 있게
		// 1페이지 혹은 10페이지 단위의 이동을 위한 것들
		
		ArrayList<Dto> list=dao.list(index);
		
		model.addAttribute("list", list);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		model.addAttribute("pageCnt", pageCnt);
		
		return "/list";
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		Dao dao=sqlSession.getMapper(Dao.class);
		dao.readnum(id);
		return "/content&id="+id;
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model)
	{
		String id = request.getParameter("id");
		Dao dao=sqlSession.getMapper(Dao.class);
		Dto dto=dao.content(id);
		
		model.addAttribute("dto", dto);
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model)
	{
		String id = request.getParameter("id");
		Dao dao=sqlSession.getMapper(Dao.class);
		Dto dto=dao.content(id);
		
		model.addAttribute("dto", dto);
		return "/update";
	}

	@RequestMapping("/update_ok")
	public String update_ok(Dto dto)
	{	
		Dao dao=sqlSession.getMapper(Dao.class);
		dao.update(dto);
		
		return "redirect:/content?id="+dto.getId();
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request)
	{
		Dao dao=sqlSession.getMapper(Dao.class);
		dao.delete(request.getParameter("id"));
		
		return "redirect:/list";
	}
}
