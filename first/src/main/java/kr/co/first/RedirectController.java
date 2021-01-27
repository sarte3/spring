package kr.co.first;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController 
{
	@RequestMapping("/redirect/first")
	public String first()
	{
		return "/redirect/first";
	}
	
	@RequestMapping("/redirect/list")
	public String listt(Model model)
	{
		model.addAttribute("name", "홍길동이당");
		return "/redirect/list";
	}
	
	@RequestMapping("/redirect/test")
	public String test() 
	{
//		return "/redirect/list"; view만 전달
		return "redirect:/redirect/list"; // 요청을 다시 보냄
	}
	
}
