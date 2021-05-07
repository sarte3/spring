package kr.co.emp.dao;

import java.util.ArrayList;

import kr.co.emp.dto.EmpDto;

public interface EmpDao {

	public void write(EmpDto dto);
	
	public ArrayList<EmpDto> list(String category, String word);
	
	public EmpDto content(String id);
	
	public void update(EmpDto dto);
	
	public void delete(String id);
	
	public Integer checkEmpno(String empno);
}
