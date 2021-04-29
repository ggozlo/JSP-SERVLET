package ggozlo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO 
{
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	DataSource dataSource;
	Context context;
	
	public int memberJoin(MemberDTO mdto)
	{
		int n =0;
		
		try
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mdto.getId());
			psmt.setString(2, mdto.getPw());
			psmt.setString(3, mdto.getName());
			psmt.setString(4, mdto.getTel());
			psmt.setString(5, mdto.getEmail());
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close();
		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return n;
	}
	
	public String memberLogin(String id, String pw)
	{
		String name = null;
		
		try
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "SELECT NAME FROM MEMBER WHERE ID=? AND PW=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			res = psmt.executeQuery();
			if(res.next())
			{
				name = res.getString("NAME");
			}

			psmt.close();
			con.close();

		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return name;
	}
	
	public int memberModify(MemberDTO mdto)
	{
		int n =0;
		
		try
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "UPDATE MEMBER SET PW=?, NAME=?, TEL=?, EMAIL=? WHERE ID=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(5, mdto.getId());
			psmt.setString(1, mdto.getPw());
			psmt.setString(2, mdto.getName());
			psmt.setString(3, mdto.getTel());
			psmt.setString(4, mdto.getEmail());
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close();
		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return n;
	}
	
	public MemberDTO memberInfo(String id)
	{
		MemberDTO info = null;
		
		try
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "SELECT * FROM MEMBER WHERE ID=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			res = psmt.executeQuery();
			if(res.next())
			{
				info = new MemberDTO(
						res.getString("ID"),
						res.getString("PW"),
						res.getString("NAME"),
						res.getString("TEL"),
						res.getString("EMAIL"));
			}

			psmt.close();
			con.close();

		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return info;
	}
	
	public ArrayList<MemberDTO> memberList()
	{
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "SELECT ID, NAME FROM MEMBER";
			psmt = con.prepareStatement(sql);
			
			res = psmt.executeQuery();
			while(res.next())
			{
				MemberDTO mdto = new MemberDTO();
				mdto.setId( res.getString("ID"));
				mdto.setName( res.getString("NAME"));
				list.add(mdto);
			}

			psmt.close();
			con.close();

		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}
}
