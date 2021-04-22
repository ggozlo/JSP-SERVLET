package ggozlo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO 
{
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet res;
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String user = "ggozlo";
	private String password = "ggozlo";
	
	public AccountDAO() 
	{
		super();
	}
	
	public int AccountSave(AccountDTO adto)
	{
		int n=0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO ACCOUNT VALUES (?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, adto.getId() );
			psmt.setString(2, adto.getPw() );
			psmt.setString(3, adto.getName() );
			n = psmt.executeUpdate();
			if(n ==1)
			{
				System.out.println("---입력완료---");
			}
			con.commit();
			con.close();
			
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("----드라이버 오류----\n"+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("----SQL 오류----\n"+e);
		}
		return n;
	}
	
	public int AccountLogin(String id, String pw)
	{
		int n=0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT ID, PW FROM ACCOUNT WHERE ID=? and PW=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			res = psmt.executeQuery();
			if(res.next())
			{
				n=1;
			}
				
			con.close();
			
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("----드라이버 오류----\n"+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("----SQL 오류----\n"+e);
		}
		return n;
	}
	
	public List<AccountDTO> getAccountList()
	{
		List<AccountDTO> adtoList = new ArrayList<>();
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM ACCOUNT";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			while(res.next())
			{
				adtoList.add( 
						new AccountDTO(
								res.getString("id"),
								res.getString("pw"), 
								res.getString("name")));
			}
			con.close();
			
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("----드라이버 오류----\n"+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("----SQL 오류----\n"+e);
		}
		return adtoList;
		
		
	}
	
	
}
