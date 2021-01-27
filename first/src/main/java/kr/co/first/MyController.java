package kr.co.first;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController 
{
	@RequestMapping("/second")
	public String second()
	{
		return "/second";
	}
	
	@RequestMapping("/req/aaa") // get, post 둘다 접근이 가능
	public String aaa()
	{
		return "/req/aaa";
	}
	
	@RequestMapping("/req/bbb") // 요청이 올 때 값을 가져온다
	public String bbb(HttpServletRequest request, Model model)
	{
//		System.out.println(request.getParameter("name"));
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("age", request.getParameter("age"));
		
		String phone = request.getParameter("phone");
		model.addAttribute("phone", phone);
		
		return "/req/bbb";
	}
	
	@RequestMapping("req/ccc")
	public String ccc(@RequestParam("name") String name, @RequestParam("age") String age, Model model)
	{
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/req/ccc";
	}
	
	@RequestMapping("req/member")
	public String member()
	{
		return "/req/member";
	}
	
	@RequestMapping("req/member_ok")
	public String member_ok(MemberDTO mdto, Model model)
	{
		System.out.println(mdto.getName());
		model.addAttribute("mdto", mdto);
		return "/req/member_ok";
	}
	
	@RequestMapping("req/ddd/{name}/{age}")
	public String ddd(@PathVariable String name, @PathVariable String age, Model model)
	{
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/req/ddd";
	}
	
	
}
