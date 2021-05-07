package kr.co.board_batis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_batis.dao.Dao;
import kr.co.board_batis.dto.MemberDto;

@Controller
public class LoginController 
{
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/main/index")
	public String index() 
	{
		return "/main/index";
	}
	
	@RequestMapping("/main/login")
	public String login(Model model, HttpServletRequest request) 
	{
		model.addAttribute("chk", request.getParameter("chk"));
		return "/main/login";
	}
	
	@RequestMapping("/main/login_ok")
	public String login_ok(MemberDto mdto, HttpSession session) 
	{
		//사용자가 입력한 아이디, 비밀번호
		
		// 데이터베이스를 대상으로 체크 -> 세션 변수를 생성(아이디, 이름)
		Dao dao=sqlSession.getMapper(Dao.class);
		MemberDto dto = dao.login_ok(mdto);
		
		if(dto==null) {
			return "redirect:/main/login?chk=1";
		}
		else 
		{
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto.getName());
			return "redirect:/main/index";
		}
	}
	
	@RequestMapping("/main/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/mypage")
	public String mypage(HttpSession session)
	{
		if(session.getAttribute("userid") == null) 
		{
			return "redirect:/main/login?chk=2";
		}
		else 
		{
			return "/main/mypage";
		}
	}
}
