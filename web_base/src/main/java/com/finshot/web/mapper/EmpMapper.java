package com.finshot.web.mapper;

import java.util.ArrayList;

import com.finshot.web.dto.EmpDto;
import com.finshot.web.dto.IdsDto;

public interface EmpMapper {

	public void write(EmpDto dto);
	
	public ArrayList<EmpDto> list(String category, String word, int mount, int index);
	
	public int getTotal(String category, String word);
	
	public EmpDto content(String id);
	
	public void update(EmpDto dto);
	
	public int checkEno(String eno);
	
	public void delete(IdsDto dto);
}
