package kr.co.board_batis.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController 
{
	@RequestMapping("/ajax")
	public String ajax() 
	{
		return "/ajax";
	}
	
	@RequestMapping("/ajax_cal")
	public void ajax_cal(HttpServletRequest request, PrintWriter out)
	{
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		
		// 합계를 구해서 다시 view 보내기
		int total = kor + eng;
		
		out.print(total);
		
	}
	
	@RequestMapping("/sung")
	public String sung()
	{
		return "/sung";
	}
	
	@RequestMapping("/ajax_cal2")
	public void ajax_cal2(HttpServletRequest request, PrintWriter out)
	{
		int jung = Integer.parseInt(request.getParameter("jung"));
		int gimal = Integer.parseInt(request.getParameter("gimal"));
		int chul = Integer.parseInt(request.getParameter("chul"));
		int report = Integer.parseInt(request.getParameter("report"));
		
		// 합계를 구해서 다시 view 보내기
		int total = jung+gimal+chul+report;
		
		out.print(total);
		
	}
}
