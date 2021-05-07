package kr.co.gesipan;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GesipanController {
	
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
	public String write_ok(HttpServletRequest req, GesipanDTO dto) throws Exception
	{
		String hobby = String.join(",", req.getParameterValues("hobby"));
		dto.setHobby(hobby);
		String email = String.join("@", req.getParameter("userid"), req.getParameter("domain"));
		dto.setEmail(email);
		
		GesipanDAO dao = new GesipanDAO();
		dao.write_ok(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception
	{
		GesipanDAO dao = new GesipanDAO();
		ArrayList<GesipanDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) throws Exception
	{
		GesipanDAO dao = new GesipanDAO();
		GesipanDTO dto = dao.content(req.getParameter("id"));
		
		model.addAttribute("dto", dto);
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest req, Model model) throws Exception
	{
		GesipanDAO dao = new GesipanDAO();
		GesipanDTO dto = dao.content(req.getParameter("id"));
		
		String email[] = dto.getEmail().split("@");
		
		model.addAttribute("dto", dto);
		model.addAttribute("email", email);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(HttpServletRequest req, GesipanDTO dto) throws Exception
	{
		int id = dto.getId();
		
		String hobby = String.join(",", req.getParameterValues("hobby"));
		dto.setHobby(hobby);
		String email = String.join("@", req.getParameter("userid"), req.getParameter("domain"));
		dto.setEmail(email);
		
		GesipanDAO dao = new GesipanDAO();
		dao.update(dto);
		
		return "redirect:/content?id="+id;
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest req) throws Exception
	{
		GesipanDAO dao = new GesipanDAO();
		dao.delete(req.getParameter("id"));
		
		return "redirect:/list";
		
	}
	
}
