package kr.co.first;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SungjukController {

	@RequestMapping("sungjuk/member")
	public String member()
	{
		return "/sungjuk/member";
	}
	
	@RequestMapping("sungjuk/member_ok")
	public String member_ok(SungDTO sDTO, Model model)
	{
		model.addAttribute("sdto", sDTO);
		
		return "/sungjuk/member_ok";
	}
	
}
