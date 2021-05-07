package kr.co.gesipan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GesipanDAO 
{
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public GesipanDAO() throws Exception 
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring?useSSL=false";
		String id = "root";
		String pw = "1234";
		
		conn = DriverManager.getConnection(url, id, pw);
	}
	
	public void close() throws Exception
	{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	
	public void write_ok(GesipanDTO dto) throws Exception
	{
		sql = "insert into gesipan(name, title, content, gender, hobby, email, writeday, pwd) "
				+ "values(?, ?, ?, ?, ?, ?, now(), ?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getGender());
		pstmt.setString(5, dto.getHobby());
		pstmt.setString(6, dto.getEmail());
		pstmt.setString(7, dto.getPwd());
		
		pstmt.executeUpdate();
		
		close();
	}
	
	public ArrayList<GesipanDTO> list() throws Exception
	{
		sql = "select * from gesipan order by id desc";
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		ArrayList<GesipanDTO> list = new ArrayList<GesipanDTO>();
		
		while(rs.next()) 
		{
			GesipanDTO dto = new GesipanDTO();
			dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			dto.setTitle(rs.getString("title"));
			dto.setWriteday(rs.getString("writeday"));
			dto.setReadnum(rs.getInt("readnum"));
			
			list.add(dto);
		}
		
		return list;
	}
	
	public void upReadnum(String id) throws Exception
	{
		sql = "update gesipan set readnum=readnum+1 where id ="+id;
		
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
	}
	
	public GesipanDTO content(String id) throws Exception
	{
		upReadnum(id);
		
		sql = "select * from gesipan where id = "+id;
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		GesipanDTO dto = new GesipanDTO();
		
		if(rs.next()) 
		{
			dto.setContent(rs.getString("content"));
			dto.setEmail(rs.getString("email"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
			dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			dto.setPwd(rs.getString("pwd"));
			dto.setReadnum(rs.getInt("readnum"));
			dto.setTitle(rs.getString("title"));
			dto.setWriteday(rs.getString("writeday"));
		}
		
		close();
		
		return dto;
	}
	
	public void update(GesipanDTO dto) throws Exception
	{
		sql = "update gesipan set name=?, title=?, content=?, gender=?, hobby=?, email=?, pwd=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getGender());
		pstmt.setString(5, dto.getHobby());
		pstmt.setString(6, dto.getEmail());
		pstmt.setString(7, dto.getPwd());
		pstmt.setInt(8, dto.getId());
		
		pstmt.executeUpdate();
		
		close();
	}
	
	public void delete(String id) throws Exception
	{
		sql = "delete from gesipan where id = "+id;
		
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
		close();
	}
	
}
