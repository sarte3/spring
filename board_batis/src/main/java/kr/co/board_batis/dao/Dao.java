package kr.co.board_batis.dao;

import java.util.ArrayList;

import kr.co.board_batis.dto.Dto;
import kr.co.board_batis.dto.MemberDto;

public interface Dao {
	//메소드 정의
	
	public void write_ok(Dto dto);
	
//	public ArrayList<Dto> list();
	
	public ArrayList<Dto> list(int index);
	
	public Dto content(String id);
	
	public void readnum(String id);
	
	public void update(Dto dto);
	
	public void delete(String id);
	
	public void pwd_check(String id, String pwd);
	
	public MemberDto login_ok(MemberDto mdto);
	
	public int getPageCnt();
	
	public ArrayList<Dto> slist(String search, String sword);
}
