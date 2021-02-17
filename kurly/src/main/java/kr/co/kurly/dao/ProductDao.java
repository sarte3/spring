package kr.co.kurly.dao;

import java.util.ArrayList;

import kr.co.kurly.dto.DaeDto;
import kr.co.kurly.dto.JungDto;

public interface ProductDao {

	public ArrayList<DaeDto> get_dae();
	
	public ArrayList<JungDto> get_jung(String daecode);
}
