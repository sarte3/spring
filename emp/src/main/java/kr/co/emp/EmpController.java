package kr.co.emp;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.emp.dao.EmpDao;
import kr.co.emp.dto.EmpDto;
import kr.co.emp.etc.CsvWriteView;

@Controller
public class EmpController {

	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	public CsvWriteView csvWriteView;
	
	@RequestMapping("/write")
	public String write()
	{
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(EmpDto dto)
	{
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		dao.write(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest req)
	{
		
		String category;
		String word;
		
		if(req.getParameter("category")==null) 
		{
			category="empno";
			word="";
		}
		else
		{
			category=req.getParameter("category"); 
			word=req.getParameter("word"); 
		}
		
		
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		ArrayList<EmpDto> list = dao.list(category, word);
		
		for(int i=0;i<list.size();i++) 
		{
			String tempEmpno = editEmpno(list.get(i).getEmpno());
			list.get(i).setEmpno(tempEmpno);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("word", word);
		
		return "/list";
	}
	
	@RequestMapping("/update")
	public String update(Model model, HttpServletRequest req)
	{
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		EmpDto dto = dao.content(req.getParameter("id"));
		
		model.addAttribute("dto", dto);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(Model model, EmpDto dto)
	{
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		dao.update(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req)
	{
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		dao.delete(req.getParameter("id"));
		
		return "redirect:/list";
	}
	
	
	@RequestMapping("/csvDownload")
    public ResponseEntity<String> csvDownload(HttpServletRequest req, HttpServletResponse response) throws Exception {
        
		String category;
		String word;
		
		if(req.getParameter("category")==null) 
		{
			category="empno";
			word="";
		}
		else
		{
			category=req.getParameter("category"); 
			word=req.getParameter("word"); 
		}
		
		
		EmpDao dao = sqlSession.getMapper(EmpDao.class); ArrayList<EmpDto> list =
		dao.list(category, word);
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/csv; charset=MS949");
		header.add("Content-Disposition", "attachment; filename=\"" + "total.csv" + "\"");

	   return new ResponseEntity<String>(setContent(list), header, HttpStatus.CREATED);

    }
	
	public String setContent(ArrayList<EmpDto> list) 
	{
		String data = "직원번호,직급,이름,전화번호,이메일\n";
		
		for(int i=0;i<list.size();i++) 
		{
			data+=list.get(i).getEmpno()+","+list.get(i).getJob()+","+list.get(i).getName()+","+list.get(i).getTel()+","+list.get(i).getEmail()+"\n";
		}
		
		return data;
	}
	
	@RequestMapping("/ajax_chk")
	public void ajax_cal(HttpServletRequest req, PrintWriter out) throws UnsupportedEncodingException
	{
		String empno= req.getParameter("empno");
		
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		int chk = dao.checkEmpno(empno);
				
		out.print(chk);
		
	}
	
	public String editEmpno(String empno) 
	{
		int eno = Integer.parseInt(empno);
		String editno=""; 
		
		if(eno/100==0&&eno/10==0) 
		{
			editno="00"+eno;
		}
		else if(eno/10>0&&eno/100==0)
		{
			editno="0"+eno;
		}
		else
		{
			editno=""+eno;
		}
		
		return editno;
	}
}
