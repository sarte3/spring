package com.finshot.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finshot.web.dto.EmpDto;
import com.finshot.web.dto.IdsDto;
import com.finshot.web.mapper.EmpMapper;

@Service
public class EmpService {

	@Autowired
	private EmpMapper mapper;
	
	public void write(EmpDto dto) 
	{
		mapper.write(dto);
	}
	
	public ArrayList<EmpDto> list(String category, String word,int mount ,int index)
	{
		
		System.out.println(category+word+index);
		ArrayList<EmpDto> list = mapper.list(category, word, mount, index);
		System.out.println("리스트 크기 : "+list.size());
		
		for(int i=0;i<list.size();i++) 
		{
			String tempEmpno = editEmpno(list.get(i).getEno());
			list.get(i).setEno(tempEmpno);
		}
		
		return list;
	}
	
	public int getTotal(String category, String word) 
	{
		return mapper.getTotal(category, word);
	}
	
	public EmpDto content(String id) 
	{
		return mapper.content(id);
	}
	
	public void update(EmpDto dto) 
	{
		mapper.update(dto);
	}
	
	public int checkEno(String eno) 
	{
		return mapper.checkEno(eno);
	}
	
	public void delete(IdsDto dto) 
	{
		mapper.delete(dto);
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
