package kr.co.board_batis.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_batis.dao.Dao;

@Controller
public class SearchController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/search/list")
	public String list(Model model, HttpServletRequest request)
	{
		String search;
		String sword;
		
		if(request.getParameter("search")==null) 
		{
			search="title";
			sword="";
		}
		else
		{
			search=request.getParameter("search"); //검색할 필드
			sword=request.getParameter("sword"); //검색할 단어
		}
		
		// 검색필드와 검색단어
		Dao dao=sqlSession.getMapper(Dao.class);
		model.addAttribute("list", dao.slist(search, sword));
		model.addAttribute("search", search);
		model.addAttribute("sword", sword);
		
		return "/search/list";
	}
}
