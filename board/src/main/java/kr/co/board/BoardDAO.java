package kr.co.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO 
{
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public BoardDAO() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring?useSSL=false";
		String id = "root";
		String pw = "1234";
		
		conn = DriverManager.getConnection(url, id, pw);
	}
	
	public void write_ok(BoardDTO bdto) throws Exception//폼 입력값 => 테이블에 저장
	{
		// 쿼리 작성
		sql = "insert into board(name, title, content, pwd, writeday) values(?, ?, ?, ?, now())";
		
		// 심부름꾼 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getName());
		pstmt.setString(2, bdto.getTitle());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
				
		// 쿼리 실행
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public ArrayList<BoardDTO> list() throws Exception
	{
		sql = "select * from board order by id desc";
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		while(rs.next()) 
		{
			BoardDTO bdto = new BoardDTO();
			bdto.setContent(rs.getString("content"));
			bdto.setId(rs.getInt("id"));
			bdto.setName(rs.getString("name"));
			bdto.setPwd(rs.getString("pwd"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setTitle(rs.getString("title"));
			bdto.setWriteday(rs.getString("writeday"));
			
			list.add(bdto);
		}
		
		return list;
	}
}
