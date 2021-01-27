package kr.co.board;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController 
{
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
}
