package kr.co.kurly.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kurly.dao.MemberDao;
import kr.co.kurly.dto.MemberDto;
import kr.co.kurly.etc.Mail_Send;

@Controller
public class MemberController {
	@Autowired
	public  SqlSession sqlSession; 
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index")
	public String index()
	{
		return "/main/index";
	}
	
	@RequestMapping("/member/member") // 회원가입문서
	public String member()
	{
		return "/member/member";
	}
	
	@RequestMapping("/member/userid_dupcheck")
	public void userid(HttpServletRequest request, PrintWriter out)
	{
		String userid=request.getParameter("userid"); // 사용자가 입력한 사용자아이디
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int n=mdao.get_userid_chk(userid);
		out.print(n);
	}
	
	@RequestMapping("/member/email_dupcheck")
	public void email(HttpServletRequest request, PrintWriter out)
	{
		String email=request.getParameter("email");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int n=mdao.get_email_chk(email);
		out.print(n);
	}
	
	@RequestMapping("/member/member_ok")
	public String member_ok(MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.member_ok(mdto);
		return "redirect:/main/index";
	}
	
	@RequestMapping("/login/login")
	public String login(HttpServletRequest request, Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return "/login/login";
	}
	
	@RequestMapping("/login/login_ok")
	public String login_ok(HttpServletRequest request, HttpSession session)
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
        MemberDto mdto=mdao.get_member(userid,pwd);
        
		if(mdto != null)
		{
			// 세션변수를 생성 (userid, name)
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", mdto.getName());
			return "redirect:/main/index";
		}
		else
		{   // 아이디,비번중에 틀린게 존재
			return "redirect:/login/login?chk=1";
		}
 
	}
	
	@RequestMapping("/login/userid_search")
	public String userid_search()
	{
		return "/login/userid_search";
	}
	
	@RequestMapping("/login/userid_view")
	public String userid_search_ok(HttpServletRequest request, Model model)
	{
		// 해당 아이디를 찾기
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
        String userid=mdao.get_userid(name, email);
        if(userid == null) // 입력정보가 잘못되었다..
        {
        	model.addAttribute("chk",2);
        }
        else
        {
        	// 아이디의 길이만큼 *처리
        	int n=userid.length()-3;
        	String star="";
        	for(int i=1;i<=n;i++)
        		star=star+"*";
        	// userid의 앞자리 3자 + 뒷에 길이만큼 ****
        	userid=userid.substring(0,3)+star;
        	model.addAttribute("chk",1);
        	model.addAttribute("userid",userid);
        }
        return "/login/userid_view";
		
	}
	
	@RequestMapping("/login/pwd_search")
	public String pwd_search()
	{
		return "/login/pwd_search";
	}
	
	@RequestMapping("/login/pwd_view")
	public String pwd_view(MemberDto mdto,Model model) throws Exception
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String pwd=mdao.get_pwd(mdto.getUserid(),mdto.getName(),mdto.getEmail());
		
		if(pwd == null)		
		{
			model.addAttribute("chk",2);
		}
		else // 아이디,이름,이메일이 맞다면 => 이메일을 전송!!
		{
			Mail_Send ms=Mail_Send.getInstance();
			String email=mdto.getEmail();
			String subject="요청하신 고객님의 이메일을 보내드립니다";
			String body="당신의 비밀번호는 "+pwd+" 입니다";
			ms.setEmail(email, subject, body);
			model.addAttribute("chk",1);
		}
		
		return "/login/pwd_view";
	}
			
}





