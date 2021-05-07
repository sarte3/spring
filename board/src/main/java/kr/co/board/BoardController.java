package kr.co.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController 
{
	@RequestMapping("/")
	public String main()
	{
		return "redirect:/list";
	}
	
	@RequestMapping("/write")
	public String write()
	{
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDTO bdto) throws Exception
	{
		// 폼에 입력된 값을 board테이블에 저장
		BoardDAO bdao=new BoardDAO();
		bdao.write_ok(bdto);
		
		return "redirect:/list"; //list로 이동
	}
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception
	{
		BoardDAO bdao=new BoardDAO();
		ArrayList<BoardDTO> list = bdao.list();
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) throws Exception
	{
		String id = request.getParameter("id");
		BoardDAO bdao=new BoardDAO();
		BoardDTO bdto=bdao.content(id);
		model.addAttribute("bdto", bdto);
		model.addAttribute("rn", "\r\n");
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) throws Exception
	{
		String id = request.getParameter("id");
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = bdao.content(id);
		model.addAttribute("bdto", bdto);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(BoardDTO bdto) throws Exception
	{
		BoardDAO bdao = new BoardDAO();
		bdao.update(bdto);
		
		return "redirect:/content?id="+bdto.getId();
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) throws Exception
	{
		BoardDAO bdao = new BoardDAO();
		bdao.delete(request.getParameter("id"));
		
		return "redirect:/list";
	}
}
