package kr.co.first;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/my")
	public ModelAndView my(ModelAndView mav) 
	{
		String name="홍길동";
		mav.addObject("name", name);
		mav.setViewName("/my");
		return mav;
	}
	
	@RequestMapping(value="/first", method=RequestMethod.GET)
	public String first()
	{
		return "/first";
	}
	
	@RequestMapping("/your")
	public String your(Model model) 
	{
		// 게시판 list
		// 읽어오는 동작이 이루어진다
		String name="배트맨";
		model.addAttribute("name", name);
		return "/your";
	}
	
	
}
