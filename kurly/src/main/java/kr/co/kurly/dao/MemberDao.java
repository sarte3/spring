package kr.co.kurly.dao;

import kr.co.kurly.dto.MemberDto;

public interface MemberDao {
    public int get_userid_chk(String userid);
    public int get_email_chk(String email);
    public void member_ok(MemberDto mdto);
    public MemberDto get_member(String userid,String pwd);
    public String get_userid(String name,String email);
    public String get_pwd(String userid,String name,String email);
}
