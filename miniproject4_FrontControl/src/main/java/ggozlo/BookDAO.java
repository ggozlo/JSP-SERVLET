package ggozlo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDAO 
{
	DataSource dataSource;
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	
	public int bookInput(BookDTO bdto)
	{
		int n =0;
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "INSERT INTO BOOK VALUES (?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bdto.getName());
			psmt.setString(2, bdto.getPublisher());
			psmt.setInt(3, bdto.getPrice());
			psmt.setInt(4, bdto.getSales());
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
	
	public ArrayList<BookDTO> bookPrint()
	{
		ArrayList<BookDTO> list = new ArrayList<>();
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "SELECT * FROM BOOK";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			
			
			while(res.next())
			{
				list.add(new BookDTO(
						res.getString("name"),
						res.getString("publisher"),
						res.getInt("price"),
						res.getInt("sales")));
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
	
	public int bookDelete(String name)
	{
		int n =0 ;
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "DELETE BOOK WHERE NAME =?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			n  = psmt.executeUpdate();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
	
	public int bookModify(BookDTO bdto)
	{
		int n =0 ;
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "UPDATE BOOK SET publisher=?, price=?, sales=? WHERE name=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(4, bdto.getName());
			psmt.setString(1, bdto.getName());
			psmt.setInt(2, bdto.getPrice());
			psmt.setInt(3, bdto.getSales());
			n  = psmt.executeUpdate();
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
}
