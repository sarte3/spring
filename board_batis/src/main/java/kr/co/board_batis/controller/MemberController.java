package kr.co.board_batis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController 
{
	@RequestMapping("/member/session_view")
	public String session_view(HttpSession session)	
	{
		// 세션 변수 생성
		session.setAttribute("userid", "kei");
		
		return "/member/session_view";
	}
	
	@RequestMapping("/member/member_view")
	public String member_view(HttpSession session)
	{
		if(session.getAttribute("userid")!=null)
			return "/member/member_view";
		else
			return "/member/login";
		
		
	}
}
